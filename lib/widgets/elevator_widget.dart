import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../game_state.dart';
import '../models.dart'; // Corrected import path

// Convert to ConsumerStatefulWidget
class ElevatorWidget extends ConsumerStatefulWidget {
  final String elevatorId;
  final VoidCallback onTap;

  const ElevatorWidget({
    super.key,
    required this.elevatorId,
    required this.onTap,
  });

  @override
  ConsumerState<ElevatorWidget> createState() => _ElevatorWidgetState();
}

// Create State class with SingleTickerProviderStateMixin
class _ElevatorWidgetState extends ConsumerState<ElevatorWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _borderColorAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _borderColorAnimation = ColorTween(
        begin: Colors.black, // Normal border color
        end: Colors.green, // Highlight color
      ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut))
      ..addStatusListener((status) {
        // Reverse animation to fade back to black
        if (status == AnimationStatus.completed) {
          _controller.reverse();
        }
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Watch the specific elevator's state
    final elevator = ref.watch(
      gameStateProvider.select(
        (gs) => gs.elevators.firstWhere((e) => e.id == widget.elevatorId),
      ),
    );

    // Listen for changes in passengers to trigger animation
    ref.listen<List<Passenger>>(
      gameStateProvider.select(
        (gs) =>
            gs.elevators
                .firstWhere((e) => e.id == widget.elevatorId)
                .passengers,
      ),
      (previousPassengers, nextPassengers) {
        // Trigger animation if the passenger list changed and controller is not already running
        if (previousPassengers != null &&
            previousPassengers.hashCode != nextPassengers.hashCode &&
            !_controller.isAnimating) {
          print(
            "[ElevatorWidget] Passengers changed for ${widget.elevatorId}, triggering animation.",
          );
          _controller.forward(from: 0.0);
        }
      },
    );

    return AnimatedBuilder(
      animation: _borderColorAnimation,
      builder: (context, child) {
        return GestureDetector(
          onTap: widget.onTap, // Use widget.onTap
          child: Container(
            width: 60,
            height: 100,
            decoration: BoxDecoration(
              color: elevator.isSelected ? Colors.blue : Colors.grey[300],
              // Use animated border color
              border: Border.all(
                color: _borderColorAnimation.value ?? Colors.black,
              ),
            ),
            child: Stack(
              children: [
                // Elevator ID and floor number
                Positioned(
                  top: 8,
                  left: 0,
                  right: 0,
                  child: Column(
                    children: [
                      Text(
                        elevator.id,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '${elevator.currentFloor.floor()}',
                        style: const TextStyle(fontSize: 12),
                      ),
                      Text(
                        '${elevator.passengers.length}/${elevator.capacity}',
                        style: const TextStyle(fontSize: 10),
                      ),
                    ],
                  ),
                ),
                // Passengers
                Positioned(
                  bottom: 8,
                  left: 0,
                  right: 0,
                  child: Wrap(
                    spacing: 4,
                    runSpacing: 4,
                    alignment: WrapAlignment.center,
                    children:
                        elevator.passengers.map((passenger) {
                          return Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              color:
                                  Colors.primaries[passenger.destinationFloor %
                                      Colors
                                          .primaries
                                          .length], // Use passenger color
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Text(
                                '${passenger.destinationFloor}',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
