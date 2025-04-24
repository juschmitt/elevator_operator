import 'package:elevator_operator/game_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models.dart';

class FloorWidget extends ConsumerWidget {
  final Floor floor;
  final double height;
  final bool isSelectable;

  const FloorWidget({
    super.key,
    required this.floor,
    required this.height,
    this.isSelectable = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gameState = ref.watch(gameStateProvider);
    final floor = gameState.floors.firstWhere(
      (f) => f.floorNumber == this.floor.floorNumber,
    );
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Floor Number
            Text(
              'Floor ${floor.floorNumber}',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: isSelectable ? Colors.blue.shade900 : Colors.black,
              ),
            ),
            // Call Buttons and Waiting Passengers
            Row(
              children: [
                // Up/Down Call Buttons
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      floor.callUpLit
                          ? Icons.arrow_upward
                          : Icons.arrow_upward_outlined,
                      color: floor.callUpLit ? Colors.red : Colors.grey,
                    ),
                    const SizedBox(height: 4),
                    Icon(
                      floor.callDownLit
                          ? Icons.arrow_downward
                          : Icons.arrow_downward_outlined,
                      color: floor.callDownLit ? Colors.red : Colors.grey,
                    ),
                  ],
                ),
                const SizedBox(width: 16),
                // Waiting Passengers
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (floor.waitingUp.isNotEmpty)
                      Text(
                        '↑ ${floor.waitingUp.length} to ${floor.waitingUp.map((p) => p.destinationFloor).join(', ')}',
                        style: const TextStyle(color: Colors.blue),
                      ),
                    if (floor.waitingDown.isNotEmpty)
                      Text(
                        '↓ ${floor.waitingDown.length} to ${floor.waitingDown.map((p) => p.destinationFloor).join(', ')}',
                        style: const TextStyle(color: Colors.blue),
                      ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
