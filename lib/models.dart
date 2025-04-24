import 'package:freezed_annotation/freezed_annotation.dart';

part 'models.freezed.dart';

enum Direction { up, down, idle }

enum PassengerStatus { waiting, inElevator, arrived, disappeared }

@freezed
abstract class Passenger with _$Passenger {
  const factory Passenger({
    required String id,
    required int spawnFloor,
    required int destinationFloor,
    @Default(PassengerStatus.waiting) PassengerStatus status,
    required DateTime spawnTime,
  }) = _Passenger;

  const Passenger._();

  Direction get direction =>
      destinationFloor > spawnFloor ? Direction.up : Direction.down;
}

@freezed
abstract class Elevator with _$Elevator {
  const factory Elevator({
    required String id,
    required double currentFloor,
    required Direction direction,
    required List<int> destinationQueue,
    required List<Passenger> passengers,
    required int capacity,
    @Default(false) bool isSelected,
  }) = _Elevator;

  const Elevator._();

  bool get isFull => passengers.length >= capacity;
}

@freezed
abstract class Floor with _$Floor {
  const factory Floor({
    required int floorNumber,
    @Default([]) List<Passenger> waitingUp,
    @Default([]) List<Passenger> waitingDown,
    @Default(false) bool callUpLit,
    @Default(false) bool callDownLit,
  }) = _Floor;
}

@freezed
abstract class GameState with _$GameState {
  const factory GameState({
    required List<Elevator> elevators,
    required List<Floor> floors,
    required List<Passenger> allPassengers,
    required int score,
    required bool isGameOver,
    required Duration elapsedGameTime,
  }) = _GameState;
}
