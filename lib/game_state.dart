import 'package:riverpod/riverpod.dart';
import 'models.dart';
import 'dart:math' as math;

final initialGameStateProvider = Provider<GameState>((ref) {
  throw UnimplementedError('initialGameStateProvider must be overridden');
});

final gameStateProvider = StateNotifierProvider<GameStateNotifier, GameState>((
  ref,
) {
  final initialGameState = ref.watch(initialGameStateProvider);
  return GameStateNotifier(initialGameState);
});

class _ElevatorTickResult {
  final Elevator updatedElevator;
  final List<Passenger> passengersGettingOff;
  final List<Passenger> passengersGettingOn;
  final bool didMove;
  final int arrivalFloor;

  _ElevatorTickResult(
    this.updatedElevator,
    this.passengersGettingOff,
    this.passengersGettingOn,
    this.didMove, {
    this.arrivalFloor = -1,
  });
}

class GameStateNotifier extends StateNotifier<GameState> {
  final GameState _initialState;
  GameStateNotifier(this._initialState) : super(_initialState);

  static const double _speed = 0.5;
  Duration _timeSinceLastSpawn = Duration.zero;
  final _random = math.Random();
  static const int _maxTotalWaitingPassengers = 10;

  final Duration _initialSpawnInterval = const Duration(seconds: 5);
  final Duration _minSpawnInterval = const Duration(seconds: 1);
  final Duration _difficultyIncreaseInterval = const Duration(seconds: 20);
  final Duration _spawnIntervalDecreaseAmount = const Duration(
    milliseconds: 150,
  );
  Duration _elapsedGameTime = Duration.zero;

  void startGame() {
    _timeSinceLastSpawn = Duration.zero;
    _elapsedGameTime = Duration.zero;
  }

  void resetGame() {
    print("--- Restarting Game ---");
    state = _initialState;
    _timeSinceLastSpawn = Duration.zero;
    _elapsedGameTime = Duration.zero;
  }

  void _spawnPassenger() {
    final floors = state.floors;
    if (floors.isEmpty) return;

    final spawnFloorIndex = _random.nextInt(floors.length);
    int destinationFloorIndex;
    do {
      destinationFloorIndex = _random.nextInt(floors.length);
    } while (destinationFloorIndex == spawnFloorIndex);

    final spawnFloor = floors[spawnFloorIndex].floorNumber;
    final destinationFloor = floors[destinationFloorIndex].floorNumber;

    final passenger = Passenger(
      id: 'P${DateTime.now().millisecondsSinceEpoch}',
      spawnFloor: spawnFloor,
      destinationFloor: destinationFloor,
      spawnTime: DateTime.now(),
    );

    addPassenger(passenger);
  }

  void addPassenger(Passenger passenger) {
    print(
      "Adding passenger: ${passenger.id} from floor ${passenger.spawnFloor} to ${passenger.destinationFloor}",
    );

    state = state.copyWith(
      floors:
          state.floors.map((floor) {
            if (floor.floorNumber == passenger.spawnFloor) {
              final waitingList =
                  passenger.direction == Direction.up
                      ? [...floor.waitingUp, passenger]
                      : [...floor.waitingDown, passenger];

              return floor.copyWith(
                waitingUp:
                    passenger.direction == Direction.up
                        ? waitingList
                        : floor.waitingUp,
                waitingDown:
                    passenger.direction == Direction.down
                        ? waitingList
                        : floor.waitingDown,
                callUpLit:
                    passenger.direction == Direction.up
                        ? true
                        : floor.callUpLit,
                callDownLit:
                    passenger.direction == Direction.down
                        ? true
                        : floor.callDownLit,
              );
            }
            return floor;
          }).toList(),
      allPassengers: [...state.allPassengers, passenger],
    );
  }

  void commandElevator(String elevatorId, int targetFloor) {
    print("Commanding elevator $elevatorId to floor $targetFloor");
    state = state.copyWith(
      elevators:
          state.elevators.map((e) {
            if (e.id == elevatorId) {
              final currentFloor = e.currentFloor;
              final direction =
                  targetFloor > currentFloor
                      ? Direction.up
                      : (targetFloor < currentFloor
                          ? Direction.down
                          : e.direction);

              List<int> newQueue = List.of(e.destinationQueue);
              if (newQueue.isEmpty || newQueue.first != targetFloor) {
                newQueue.add(targetFloor);
              }

              print(
                "Elevator ${e.id} current floor: $currentFloor, target: $targetFloor, new queue: $newQueue, direction: $direction",
              );
              return e.copyWith(
                direction: newQueue.isEmpty ? Direction.idle : direction,
                destinationQueue: newQueue,
                isSelected: false,
              );
            }
            return e;
          }).toList(),
    );
  }

  _ElevatorTickResult _processSingleElevatorTick(Elevator e, Duration elapsed) {
    if (e.destinationQueue.isEmpty) {
      if (e.direction != Direction.idle) {
        final arrivalFloor = e.currentFloor.round();
        if (e.currentFloor == arrivalFloor.toDouble()) {
          print(
            "[Idle Check] Elevator ${e.id} arrived at $arrivalFloor with empty queue. Processing arrival.",
          );
          final currentPassengersInElevator = elevatorArrivedAtFloor(
            e.id,
            arrivalFloor,
          );
          final passengersGettingOff =
              e.passengers
                  .where((p) => p.destinationFloor == arrivalFloor)
                  .toList();
          final passengersGettingOn =
              currentPassengersInElevator
                  .where((p) => !e.passengers.contains(p))
                  .toList();

          return _ElevatorTickResult(
            e.copyWith(
              passengers: currentPassengersInElevator,
              direction: Direction.idle,
            ),
            passengersGettingOff,
            passengersGettingOn,
            false,
            arrivalFloor: arrivalFloor,
          );
        }
      }
      return _ElevatorTickResult(
        e.copyWith(direction: Direction.idle),
        [],
        [],
        false,
      );
    }

    final targetFloor = e.destinationQueue.first;
    final currentFloor = e.currentFloor;
    final moveDirection =
        targetFloor > currentFloor
            ? Direction.up
            : (targetFloor < currentFloor ? Direction.down : Direction.idle);

    bool didMove = false;
    Elevator updatedElevator = e.copyWith(direction: moveDirection);
    List<Passenger> passengersGettingOff = [];
    List<Passenger> passengersGettingOn = [];
    int arrivalFloor = -1;

    final double elapsedSeconds =
        elapsed.inMicroseconds / Duration.microsecondsPerSecond;
    final double moveDistance = _speed * elapsedSeconds;

    if (moveDirection == Direction.up && currentFloor < targetFloor) {
      final newFloor = currentFloor + moveDistance;

      if (newFloor >= targetFloor) {
        print("[Update] Elevator ${e.id} arrived UP at $targetFloor");
        arrivalFloor = targetFloor;
        final currentPassengersInElevator = elevatorArrivedAtFloor(
          e.id,
          targetFloor,
        );
        passengersGettingOff =
            e.passengers
                .where((p) => p.destinationFloor == targetFloor)
                .toList();
        passengersGettingOn =
            currentPassengersInElevator
                .where((p) => !e.passengers.contains(p))
                .toList();

        final remainingQueue = e.destinationQueue.sublist(1);
        final nextDirection =
            remainingQueue.isEmpty
                ? Direction.idle
                : (remainingQueue.first > targetFloor
                    ? Direction.up
                    : Direction.down);

        updatedElevator = e.copyWith(
          currentFloor: targetFloor.toDouble(),
          destinationQueue: remainingQueue,
          passengers: currentPassengersInElevator,
          direction: nextDirection,
        );
        didMove = true;
      } else {
        updatedElevator = e.copyWith(currentFloor: newFloor);
        didMove = true;
      }
    } else if (moveDirection == Direction.down && currentFloor > targetFloor) {
      final newFloor = currentFloor - moveDistance;

      if (newFloor <= targetFloor) {
        print("[Update] Elevator ${e.id} arrived DOWN at $targetFloor");
        arrivalFloor = targetFloor;
        final currentPassengersInElevator = elevatorArrivedAtFloor(
          e.id,
          targetFloor,
        );
        passengersGettingOff =
            e.passengers
                .where((p) => p.destinationFloor == targetFloor)
                .toList();
        passengersGettingOn =
            currentPassengersInElevator
                .where((p) => !e.passengers.contains(p))
                .toList();

        final remainingQueue = e.destinationQueue.sublist(1);
        final nextDirection =
            remainingQueue.isEmpty
                ? Direction.idle
                : (remainingQueue.first > targetFloor
                    ? Direction.up
                    : Direction.down);

        updatedElevator = e.copyWith(
          currentFloor: targetFloor.toDouble(),
          destinationQueue: remainingQueue,
          passengers: currentPassengersInElevator,
          direction: nextDirection,
        );
        didMove = true;
      } else {
        updatedElevator = e.copyWith(currentFloor: newFloor);
        didMove = true;
      }
    } else if (currentFloor == targetFloor.toDouble()) {
      print("[Update] Elevator ${e.id} arrived/waiting at $targetFloor");
      arrivalFloor = targetFloor;
      final currentPassengersInElevator = elevatorArrivedAtFloor(
        e.id,
        targetFloor,
      );
      passengersGettingOff =
          e.passengers.where((p) => p.destinationFloor == targetFloor).toList();
      passengersGettingOn =
          currentPassengersInElevator
              .where((p) => !e.passengers.contains(p))
              .toList();

      final remainingQueue = e.destinationQueue.sublist(1);
      final nextDirection =
          remainingQueue.isEmpty
              ? Direction.idle
              : (remainingQueue.first > targetFloor
                  ? Direction.up
                  : Direction.down);

      updatedElevator = e.copyWith(
        destinationQueue: remainingQueue,
        passengers: currentPassengersInElevator,
        direction: nextDirection,
      );
      didMove = false;
    } else {
      print(
        "[Warning] Elevator ${e.id} at ${e.currentFloor} with target $targetFloor but moveDirection is Idle. Recalculating direction.",
      );
      final direction =
          targetFloor > currentFloor
              ? Direction.up
              : (targetFloor < currentFloor ? Direction.down : Direction.idle);
      updatedElevator = updatedElevator.copyWith(direction: direction);
      didMove = false;
    }

    return _ElevatorTickResult(
      updatedElevator,
      passengersGettingOff,
      passengersGettingOn,
      didMove,
      arrivalFloor: arrivalFloor,
    );
  }

  List<Floor> _updateFloorsAfterTick(
    List<Floor> currentFloors,
    Map<int, List<Passenger>> allPassengersGettingOnByFloor,
  ) {
    return currentFloors.map((f) {
      if (allPassengersGettingOnByFloor.containsKey(f.floorNumber)) {
        final gettingOnThisFloor =
            allPassengersGettingOnByFloor[f.floorNumber]!;
        final remainingWaitingUp =
            f.waitingUp.where((p) => !gettingOnThisFloor.contains(p)).toList();
        final remainingWaitingDown =
            f.waitingDown
                .where((p) => !gettingOnThisFloor.contains(p))
                .toList();

        return f.copyWith(
          waitingUp: remainingWaitingUp,
          waitingDown: remainingWaitingDown,
          callUpLit: remainingWaitingUp.isNotEmpty,
          callDownLit: remainingWaitingDown.isNotEmpty,
        );
      }
      return f;
    }).toList();
  }

  List<Passenger> _updateAllPassengersAfterTick(
    List<Passenger> currentAllPassengers,
    List<Passenger> passengersGettingOff,
    Map<int, List<Passenger>> allPassengersGettingOnByFloor,
  ) {
    final allGettingOn =
        allPassengersGettingOnByFloor.values.expand((list) => list).toSet();
    return currentAllPassengers.map((p) {
      if (passengersGettingOff.contains(p)) {
        return p.copyWith(status: PassengerStatus.arrived);
      } else if (allGettingOn.contains(p)) {
        return p.copyWith(status: PassengerStatus.inElevator);
      }
      return p;
    }).toList();
  }

  void _updateGameLogic(Duration elapsed) {
    if (state.isGameOver) return; // Stop updates if game is over

    List<Elevator> processedElevators = [];
    List<Passenger> passengersGettingOffThisTick = [];
    Map<int, List<Passenger>> passengersGettingOnThisTickByFloor = {};
    bool anyElevatorDidMove = false;

    for (final elevator in state.elevators) {
      final result = _processSingleElevatorTick(elevator, elapsed);

      processedElevators.add(result.updatedElevator);
      passengersGettingOffThisTick.addAll(result.passengersGettingOff);
      if (result.arrivalFloor != -1 && result.passengersGettingOn.isNotEmpty) {
        passengersGettingOnThisTickByFloor
            .putIfAbsent(result.arrivalFloor, () => [])
            .addAll(result.passengersGettingOn);
      }
      anyElevatorDidMove = anyElevatorDidMove || result.didMove;
    }

    final updatedFloors = _updateFloorsAfterTick(
      state.floors,
      passengersGettingOnThisTickByFloor,
    );

    final updatedAllPassengers = _updateAllPassengersAfterTick(
      state.allPassengers,
      passengersGettingOffThisTick,
      passengersGettingOnThisTickByFloor,
    );

    int scoreGainedThisTick = 0;
    for (final passenger in passengersGettingOffThisTick) {
      scoreGainedThisTick += calculateScore(passenger);
    }

    // --- Game Over Check ---
    int totalWaitingPassengers = 0;
    for (final floor in updatedFloors) {
      totalWaitingPassengers += floor.waitingUp.length;
      totalWaitingPassengers += floor.waitingDown.length;
    }

    bool gameOver =
        state.isGameOver || totalWaitingPassengers > _maxTotalWaitingPassengers;
    if (gameOver && !state.isGameOver) {
      print(
        "--- GAME OVER --- Too many passengers waiting ($totalWaitingPassengers > $_maxTotalWaitingPassengers)",
      );
    }
    // --- End Game Over Check ---

    state = state.copyWith(
      elevators: processedElevators,
      floors: updatedFloors,
      allPassengers: updatedAllPassengers,
      score: state.score + scoreGainedThisTick,
      isGameOver: gameOver, // Update game over status
      elapsedGameTime: _elapsedGameTime, // Pass the updated game time
    );
  }

  void updateElevatorPosition(String elevatorId, double newFloor) {
    state = state.copyWith(
      elevators:
          state.elevators.map((e) {
            if (e.id == elevatorId) {
              return e.copyWith(currentFloor: newFloor);
            }
            return e;
          }).toList(),
    );
  }

  List<Passenger> elevatorArrivedAtFloor(String elevatorId, int floor) {
    final elevator = state.elevators.firstWhere((e) => e.id == elevatorId);
    final currentFloor = state.floors.firstWhere((f) => f.floorNumber == floor);
    final int topFloor = state.floors.length - 1;

    final passengersGettingOff =
        elevator.passengers.where((p) => p.destinationFloor == floor).toList();

    final currentPassengerCount = elevator.passengers.length;
    final availableSpace = (elevator.capacity -
            currentPassengerCount +
            passengersGettingOff.length)
        .clamp(0, elevator.capacity);

    final allWaitingPassengers = [
      ...currentFloor.waitingUp,
      ...currentFloor.waitingDown,
    ];

    final passengersGettingOn =
        allWaitingPassengers
            .where((p) {
              if (availableSpace <= 0) return false;

              if (elevator.direction == Direction.idle) return true;

              if (elevator.direction == Direction.up &&
                  p.destinationFloor > floor) {
                return true;
              }
              if (elevator.direction == Direction.down &&
                  p.destinationFloor < floor) {
                return true;
              }

              if (floor == topFloor && p.destinationFloor < floor) {
                return true;
              }
              if (floor == 0 && p.destinationFloor > floor) {
                return true;
              }

              return false;
            })
            .take(availableSpace)
            .toList();

    print("Elevator ${elevator.id} arrived at floor $floor:");
    print("- Passengers getting off: ${passengersGettingOff.length}");
    print(
      "- Passengers getting on: ${passengersGettingOn.length} (Available space: $availableSpace)",
    );

    final remainingPassengers =
        elevator.passengers.where((p) => p.destinationFloor != floor).toList();
    final newPassengers = [...remainingPassengers, ...passengersGettingOn];

    return newPassengers;
  }

  int calculateScore(Passenger arrivedPassenger) {
    final waitTime = DateTime.now().difference(arrivedPassenger.spawnTime);
    final score = (100 - waitTime.inSeconds).clamp(0, 100);
    print("Passenger ${arrivedPassenger.id} arrived! Score: +$score");
    return score;
  }

  Duration _getCurrentSpawnInterval() {
    final decreases =
        (_elapsedGameTime.inSeconds / _difficultyIncreaseInterval.inSeconds)
            .floor();
    final totalDecrease = _spawnIntervalDecreaseAmount * decreases;
    final currentInterval = _initialSpawnInterval - totalDecrease;
    // Clamp the interval to the minimum spawn time
    if (currentInterval < _minSpawnInterval) {
      return _minSpawnInterval;
    }
    return currentInterval;
  }

  void tick(Duration elapsed) {
    if (state.isGameOver) return; // Stop ticking if game is over

    _elapsedGameTime += elapsed; // Increment game time

    final currentSpawnInterval = _getCurrentSpawnInterval();

    _timeSinceLastSpawn += elapsed;
    if (_timeSinceLastSpawn >= currentSpawnInterval) {
      _spawnPassenger();
      _timeSinceLastSpawn -= currentSpawnInterval; // Use the current interval
    }

    _updateGameLogic(elapsed);
  }

  void selectElevator(String elevatorId) {
    state = state.copyWith(
      elevators:
          state.elevators.map((e) {
            return e.copyWith(isSelected: e.id == elevatorId);
          }).toList(),
    );
  }
}
