enum Direction { Up, Down, Idle }

enum PassengerStatus { Waiting, InElevator, Arrived }

class Passenger {
  final String id;
  final int spawnFloor;
  final int destinationFloor;
  PassengerStatus status;
  DateTime spawnTime; // To calculate wait time

  Passenger({
    required this.id,
    required this.spawnFloor,
    required this.destinationFloor,
    this.status = PassengerStatus.Waiting,
    required this.spawnTime,
  });
  Passenger copyWith({
    String? id,
    int? spawnFloor,
    int? destinationFloor,
    PassengerStatus? status,
    DateTime? spawnTime,
  }) {
    return Passenger(
      id: id ?? this.id,
      spawnFloor: spawnFloor ?? this.spawnFloor,
      destinationFloor: destinationFloor ?? this.destinationFloor,
      status: status ?? this.status,
      spawnTime: spawnTime ?? this.spawnTime,
    );
  }

  Direction get direction =>
      destinationFloor > spawnFloor ? Direction.Up : Direction.Down;
}

class Elevator {
  final String id;
  final double currentFloor;
  final Direction direction;
  final List<int> destinationQueue;
  final List<Passenger> passengers;
  final int capacity;
  final bool isSelected;

  const Elevator({
    required this.id,
    required this.currentFloor,
    required this.direction,
    required this.destinationQueue,
    required this.passengers,
    required this.capacity,
    this.isSelected = false,
  });

  Elevator copyWith({
    String? id,
    double? currentFloor,
    Direction? direction,
    List<int>? destinationQueue,
    List<Passenger>? passengers,
    int? capacity,
    bool? isSelected,
  }) {
    return Elevator(
      id: id ?? this.id,
      currentFloor: currentFloor ?? this.currentFloor,
      direction: direction ?? this.direction,
      destinationQueue: destinationQueue ?? this.destinationQueue,
      passengers: passengers ?? this.passengers,
      capacity: capacity ?? this.capacity,
      isSelected: isSelected ?? this.isSelected,
    );
  }

  bool get isFull => passengers.length >= capacity;
}

class Floor {
  final int floorNumber;
  List<Passenger> waitingUp;
  List<Passenger> waitingDown;
  bool callUpLit;
  bool callDownLit;

  Floor({
    required this.floorNumber,
    this.waitingUp = const [],
    this.waitingDown = const [],
    this.callUpLit = false,
    this.callDownLit = false,
  }); //
  Floor copyWith({
    int? floorNumber,
    List<Passenger>? waitingUp,
    List<Passenger>? waitingDown,
    bool? callUpLit,
    bool? callDownLit,
  }) {
    return Floor(
      floorNumber: floorNumber ?? this.floorNumber,
      waitingUp: waitingUp ?? this.waitingUp,
      waitingDown: waitingDown ?? this.waitingDown,
      callUpLit: callUpLit ?? this.callUpLit,
      callDownLit: callDownLit ?? this.callDownLit,
    );
  }
}

class GameState {
  List<Elevator> elevators;
  List<Floor> floors;
  List<Passenger> allPassengers; // Maybe track all active ones
  int score;
  final bool isGameOver;
  // Potentially game timer, difficulty level, etc.

  GameState({
    required this.elevators,
    required this.floors,
    this.allPassengers = const [],
    this.score = 0,
    this.isGameOver = false,
  });
  GameState copyWith({
    List<Elevator>? elevators,
    List<Floor>? floors,
    List<Passenger>? allPassengers,
    int? score,
    bool? isGameOver,
  }) {
    return GameState(
      elevators: elevators ?? this.elevators,
      floors: floors ?? this.floors,
      allPassengers: allPassengers ?? this.allPassengers,
      score: score ?? this.score,
      isGameOver: isGameOver ?? this.isGameOver,
    );
  }
}
