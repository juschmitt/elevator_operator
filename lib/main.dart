import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'models.dart'; // Assuming your models are in models.dart
import 'game_state.dart'; // We'll create this soon
import 'screens/game_screen.dart'; // We'll create this soon

void main() {
  final initialGameState = GameState(
    floors: List.generate(6, (index) => Floor(floorNumber: index)),
    elevators: [
      Elevator(
        id: 'E1',
        capacity: 8,
        currentFloor: 0.0,
        direction: Direction.Up,
        destinationQueue: [],
        passengers: [],
        isSelected: false,
      ),
    ],
    score: 0,
    allPassengers: [],
    isGameOver: false,
    elapsedGameTime: Duration.zero,
  );

  runApp(
    ProviderScope(
      overrides: [initialGameStateProvider.overrideWithValue(initialGameState)],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Elevator Operator',
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      home: const GameScreen(),
    );
  }
}
