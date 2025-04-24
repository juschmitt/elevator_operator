import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../game_state.dart';
import 'floor_widget.dart';
import 'elevator_widget.dart';

const double FLOOR_HEIGHT = 100.0;
const double ELEVATOR_SHAFT_WIDTH = 80.0;

class BuildingWidget extends ConsumerStatefulWidget {
  const BuildingWidget({super.key});

  @override
  ConsumerState<BuildingWidget> createState() => _BuildingWidgetState();
}

class _BuildingWidgetState extends ConsumerState<BuildingWidget> {
  void _handleElevatorTap(String elevatorId) {
    ref.read(gameStateProvider.notifier).selectElevator(elevatorId);
  }

  void _handleFloorTap(int floorNumber) {
    final gameState = ref.read(gameStateProvider);
    final selectedElevator = gameState.elevators.firstWhere(
      (e) => e.isSelected,
      orElse: () => throw Exception('No elevator selected'),
    );

    ref
        .read(gameStateProvider.notifier)
        .commandElevator(selectedElevator.id, floorNumber);
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return "$minutes:$seconds";
  }

  @override
  Widget build(BuildContext context) {
    final gameState = ref.watch(gameStateProvider);
    final floors = gameState.floors;
    final elevators = gameState.elevators;
    final int floorCount = floors.length;
    final bool hasSelectedElevator = elevators.any((e) => e.isSelected);
    final int score = gameState.score;
    final String elapsedTimeFormatted = _formatDuration(
      gameState.elapsedGameTime,
    );

    // Total height of the floor area
    final double buildingContentHeight = floorCount * FLOOR_HEIGHT;

    return Container(
      color: Colors.grey[300],
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          // Floors (rendered bottom-up)
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children:
                floors.reversed.map((floor) {
                  return GestureDetector(
                    onTap: () => _handleFloorTap(floor.floorNumber),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(
                            color:
                                hasSelectedElevator
                                    ? Colors.blue.shade200
                                    : Colors.grey.shade400,
                            width: hasSelectedElevator ? 2.0 : 1.0,
                          ),
                        ),
                      ),
                      child: FloorWidget(
                        floor: floor,
                        height: FLOOR_HEIGHT,
                        isSelectable: hasSelectedElevator,
                      ),
                    ),
                  );
                }).toList(),
          ),

          // Elevator Shafts and Elevators
          Positioned.fill(
            child: Padding(
              padding: const EdgeInsets.only(left: 100.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: List.generate(elevators.length, (index) {
                    final elevator = elevators[index];
                    final double bottomPadding =
                        elevator.currentFloor * FLOOR_HEIGHT;

                    return Padding(
                      padding: EdgeInsets.only(
                        left: index == 0 ? 20.0 : 0.0,
                        right: 20.0,
                      ),
                      child: SizedBox(
                        width: ELEVATOR_SHAFT_WIDTH,
                        height: buildingContentHeight,
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            Container(
                              width: ELEVATOR_SHAFT_WIDTH,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.black54,
                                  width: 1,
                                ),
                                color: Colors.black.withOpacity(0.05),
                              ),
                            ),
                            Positioned(
                              bottom: bottomPadding,
                              child: ElevatorWidget(
                                elevatorId: elevator.id,
                                onTap: () => _handleElevatorTap(elevator.id),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),
          ),

          // Score and Time Display
          Positioned(
            top: 10.0,
            left: 10.0,
            right: 10.0,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 12.0,
                vertical: 8.0,
              ),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.6),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Score: $score',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Time: $elapsedTimeFormatted',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
