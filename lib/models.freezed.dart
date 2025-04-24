// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Passenger {

 String get id; int get spawnFloor; int get destinationFloor; PassengerStatus get status; DateTime get spawnTime;
/// Create a copy of Passenger
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PassengerCopyWith<Passenger> get copyWith => _$PassengerCopyWithImpl<Passenger>(this as Passenger, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Passenger&&(identical(other.id, id) || other.id == id)&&(identical(other.spawnFloor, spawnFloor) || other.spawnFloor == spawnFloor)&&(identical(other.destinationFloor, destinationFloor) || other.destinationFloor == destinationFloor)&&(identical(other.status, status) || other.status == status)&&(identical(other.spawnTime, spawnTime) || other.spawnTime == spawnTime));
}


@override
int get hashCode => Object.hash(runtimeType,id,spawnFloor,destinationFloor,status,spawnTime);

@override
String toString() {
  return 'Passenger(id: $id, spawnFloor: $spawnFloor, destinationFloor: $destinationFloor, status: $status, spawnTime: $spawnTime)';
}


}

/// @nodoc
abstract mixin class $PassengerCopyWith<$Res>  {
  factory $PassengerCopyWith(Passenger value, $Res Function(Passenger) _then) = _$PassengerCopyWithImpl;
@useResult
$Res call({
 String id, int spawnFloor, int destinationFloor, PassengerStatus status, DateTime spawnTime
});




}
/// @nodoc
class _$PassengerCopyWithImpl<$Res>
    implements $PassengerCopyWith<$Res> {
  _$PassengerCopyWithImpl(this._self, this._then);

  final Passenger _self;
  final $Res Function(Passenger) _then;

/// Create a copy of Passenger
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? spawnFloor = null,Object? destinationFloor = null,Object? status = null,Object? spawnTime = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,spawnFloor: null == spawnFloor ? _self.spawnFloor : spawnFloor // ignore: cast_nullable_to_non_nullable
as int,destinationFloor: null == destinationFloor ? _self.destinationFloor : destinationFloor // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as PassengerStatus,spawnTime: null == spawnTime ? _self.spawnTime : spawnTime // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// @nodoc


class _Passenger extends Passenger {
  const _Passenger({required this.id, required this.spawnFloor, required this.destinationFloor, this.status = PassengerStatus.waiting, required this.spawnTime}): super._();
  

@override final  String id;
@override final  int spawnFloor;
@override final  int destinationFloor;
@override@JsonKey() final  PassengerStatus status;
@override final  DateTime spawnTime;

/// Create a copy of Passenger
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PassengerCopyWith<_Passenger> get copyWith => __$PassengerCopyWithImpl<_Passenger>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Passenger&&(identical(other.id, id) || other.id == id)&&(identical(other.spawnFloor, spawnFloor) || other.spawnFloor == spawnFloor)&&(identical(other.destinationFloor, destinationFloor) || other.destinationFloor == destinationFloor)&&(identical(other.status, status) || other.status == status)&&(identical(other.spawnTime, spawnTime) || other.spawnTime == spawnTime));
}


@override
int get hashCode => Object.hash(runtimeType,id,spawnFloor,destinationFloor,status,spawnTime);

@override
String toString() {
  return 'Passenger(id: $id, spawnFloor: $spawnFloor, destinationFloor: $destinationFloor, status: $status, spawnTime: $spawnTime)';
}


}

/// @nodoc
abstract mixin class _$PassengerCopyWith<$Res> implements $PassengerCopyWith<$Res> {
  factory _$PassengerCopyWith(_Passenger value, $Res Function(_Passenger) _then) = __$PassengerCopyWithImpl;
@override @useResult
$Res call({
 String id, int spawnFloor, int destinationFloor, PassengerStatus status, DateTime spawnTime
});




}
/// @nodoc
class __$PassengerCopyWithImpl<$Res>
    implements _$PassengerCopyWith<$Res> {
  __$PassengerCopyWithImpl(this._self, this._then);

  final _Passenger _self;
  final $Res Function(_Passenger) _then;

/// Create a copy of Passenger
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? spawnFloor = null,Object? destinationFloor = null,Object? status = null,Object? spawnTime = null,}) {
  return _then(_Passenger(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,spawnFloor: null == spawnFloor ? _self.spawnFloor : spawnFloor // ignore: cast_nullable_to_non_nullable
as int,destinationFloor: null == destinationFloor ? _self.destinationFloor : destinationFloor // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as PassengerStatus,spawnTime: null == spawnTime ? _self.spawnTime : spawnTime // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

/// @nodoc
mixin _$Elevator {

 String get id; double get currentFloor; Direction get direction; List<int> get destinationQueue; List<Passenger> get passengers; int get capacity; bool get isSelected;
/// Create a copy of Elevator
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ElevatorCopyWith<Elevator> get copyWith => _$ElevatorCopyWithImpl<Elevator>(this as Elevator, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Elevator&&(identical(other.id, id) || other.id == id)&&(identical(other.currentFloor, currentFloor) || other.currentFloor == currentFloor)&&(identical(other.direction, direction) || other.direction == direction)&&const DeepCollectionEquality().equals(other.destinationQueue, destinationQueue)&&const DeepCollectionEquality().equals(other.passengers, passengers)&&(identical(other.capacity, capacity) || other.capacity == capacity)&&(identical(other.isSelected, isSelected) || other.isSelected == isSelected));
}


@override
int get hashCode => Object.hash(runtimeType,id,currentFloor,direction,const DeepCollectionEquality().hash(destinationQueue),const DeepCollectionEquality().hash(passengers),capacity,isSelected);

@override
String toString() {
  return 'Elevator(id: $id, currentFloor: $currentFloor, direction: $direction, destinationQueue: $destinationQueue, passengers: $passengers, capacity: $capacity, isSelected: $isSelected)';
}


}

/// @nodoc
abstract mixin class $ElevatorCopyWith<$Res>  {
  factory $ElevatorCopyWith(Elevator value, $Res Function(Elevator) _then) = _$ElevatorCopyWithImpl;
@useResult
$Res call({
 String id, double currentFloor, Direction direction, List<int> destinationQueue, List<Passenger> passengers, int capacity, bool isSelected
});




}
/// @nodoc
class _$ElevatorCopyWithImpl<$Res>
    implements $ElevatorCopyWith<$Res> {
  _$ElevatorCopyWithImpl(this._self, this._then);

  final Elevator _self;
  final $Res Function(Elevator) _then;

/// Create a copy of Elevator
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? currentFloor = null,Object? direction = null,Object? destinationQueue = null,Object? passengers = null,Object? capacity = null,Object? isSelected = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,currentFloor: null == currentFloor ? _self.currentFloor : currentFloor // ignore: cast_nullable_to_non_nullable
as double,direction: null == direction ? _self.direction : direction // ignore: cast_nullable_to_non_nullable
as Direction,destinationQueue: null == destinationQueue ? _self.destinationQueue : destinationQueue // ignore: cast_nullable_to_non_nullable
as List<int>,passengers: null == passengers ? _self.passengers : passengers // ignore: cast_nullable_to_non_nullable
as List<Passenger>,capacity: null == capacity ? _self.capacity : capacity // ignore: cast_nullable_to_non_nullable
as int,isSelected: null == isSelected ? _self.isSelected : isSelected // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// @nodoc


class _Elevator extends Elevator {
  const _Elevator({required this.id, required this.currentFloor, required this.direction, required final  List<int> destinationQueue, required final  List<Passenger> passengers, required this.capacity, this.isSelected = false}): _destinationQueue = destinationQueue,_passengers = passengers,super._();
  

@override final  String id;
@override final  double currentFloor;
@override final  Direction direction;
 final  List<int> _destinationQueue;
@override List<int> get destinationQueue {
  if (_destinationQueue is EqualUnmodifiableListView) return _destinationQueue;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_destinationQueue);
}

 final  List<Passenger> _passengers;
@override List<Passenger> get passengers {
  if (_passengers is EqualUnmodifiableListView) return _passengers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_passengers);
}

@override final  int capacity;
@override@JsonKey() final  bool isSelected;

/// Create a copy of Elevator
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ElevatorCopyWith<_Elevator> get copyWith => __$ElevatorCopyWithImpl<_Elevator>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Elevator&&(identical(other.id, id) || other.id == id)&&(identical(other.currentFloor, currentFloor) || other.currentFloor == currentFloor)&&(identical(other.direction, direction) || other.direction == direction)&&const DeepCollectionEquality().equals(other._destinationQueue, _destinationQueue)&&const DeepCollectionEquality().equals(other._passengers, _passengers)&&(identical(other.capacity, capacity) || other.capacity == capacity)&&(identical(other.isSelected, isSelected) || other.isSelected == isSelected));
}


@override
int get hashCode => Object.hash(runtimeType,id,currentFloor,direction,const DeepCollectionEquality().hash(_destinationQueue),const DeepCollectionEquality().hash(_passengers),capacity,isSelected);

@override
String toString() {
  return 'Elevator(id: $id, currentFloor: $currentFloor, direction: $direction, destinationQueue: $destinationQueue, passengers: $passengers, capacity: $capacity, isSelected: $isSelected)';
}


}

/// @nodoc
abstract mixin class _$ElevatorCopyWith<$Res> implements $ElevatorCopyWith<$Res> {
  factory _$ElevatorCopyWith(_Elevator value, $Res Function(_Elevator) _then) = __$ElevatorCopyWithImpl;
@override @useResult
$Res call({
 String id, double currentFloor, Direction direction, List<int> destinationQueue, List<Passenger> passengers, int capacity, bool isSelected
});




}
/// @nodoc
class __$ElevatorCopyWithImpl<$Res>
    implements _$ElevatorCopyWith<$Res> {
  __$ElevatorCopyWithImpl(this._self, this._then);

  final _Elevator _self;
  final $Res Function(_Elevator) _then;

/// Create a copy of Elevator
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? currentFloor = null,Object? direction = null,Object? destinationQueue = null,Object? passengers = null,Object? capacity = null,Object? isSelected = null,}) {
  return _then(_Elevator(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,currentFloor: null == currentFloor ? _self.currentFloor : currentFloor // ignore: cast_nullable_to_non_nullable
as double,direction: null == direction ? _self.direction : direction // ignore: cast_nullable_to_non_nullable
as Direction,destinationQueue: null == destinationQueue ? _self._destinationQueue : destinationQueue // ignore: cast_nullable_to_non_nullable
as List<int>,passengers: null == passengers ? _self._passengers : passengers // ignore: cast_nullable_to_non_nullable
as List<Passenger>,capacity: null == capacity ? _self.capacity : capacity // ignore: cast_nullable_to_non_nullable
as int,isSelected: null == isSelected ? _self.isSelected : isSelected // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc
mixin _$Floor {

 int get floorNumber; List<Passenger> get waitingUp; List<Passenger> get waitingDown; bool get callUpLit; bool get callDownLit;
/// Create a copy of Floor
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FloorCopyWith<Floor> get copyWith => _$FloorCopyWithImpl<Floor>(this as Floor, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Floor&&(identical(other.floorNumber, floorNumber) || other.floorNumber == floorNumber)&&const DeepCollectionEquality().equals(other.waitingUp, waitingUp)&&const DeepCollectionEquality().equals(other.waitingDown, waitingDown)&&(identical(other.callUpLit, callUpLit) || other.callUpLit == callUpLit)&&(identical(other.callDownLit, callDownLit) || other.callDownLit == callDownLit));
}


@override
int get hashCode => Object.hash(runtimeType,floorNumber,const DeepCollectionEquality().hash(waitingUp),const DeepCollectionEquality().hash(waitingDown),callUpLit,callDownLit);

@override
String toString() {
  return 'Floor(floorNumber: $floorNumber, waitingUp: $waitingUp, waitingDown: $waitingDown, callUpLit: $callUpLit, callDownLit: $callDownLit)';
}


}

/// @nodoc
abstract mixin class $FloorCopyWith<$Res>  {
  factory $FloorCopyWith(Floor value, $Res Function(Floor) _then) = _$FloorCopyWithImpl;
@useResult
$Res call({
 int floorNumber, List<Passenger> waitingUp, List<Passenger> waitingDown, bool callUpLit, bool callDownLit
});




}
/// @nodoc
class _$FloorCopyWithImpl<$Res>
    implements $FloorCopyWith<$Res> {
  _$FloorCopyWithImpl(this._self, this._then);

  final Floor _self;
  final $Res Function(Floor) _then;

/// Create a copy of Floor
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? floorNumber = null,Object? waitingUp = null,Object? waitingDown = null,Object? callUpLit = null,Object? callDownLit = null,}) {
  return _then(_self.copyWith(
floorNumber: null == floorNumber ? _self.floorNumber : floorNumber // ignore: cast_nullable_to_non_nullable
as int,waitingUp: null == waitingUp ? _self.waitingUp : waitingUp // ignore: cast_nullable_to_non_nullable
as List<Passenger>,waitingDown: null == waitingDown ? _self.waitingDown : waitingDown // ignore: cast_nullable_to_non_nullable
as List<Passenger>,callUpLit: null == callUpLit ? _self.callUpLit : callUpLit // ignore: cast_nullable_to_non_nullable
as bool,callDownLit: null == callDownLit ? _self.callDownLit : callDownLit // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// @nodoc


class _Floor implements Floor {
  const _Floor({required this.floorNumber, final  List<Passenger> waitingUp = const [], final  List<Passenger> waitingDown = const [], this.callUpLit = false, this.callDownLit = false}): _waitingUp = waitingUp,_waitingDown = waitingDown;
  

@override final  int floorNumber;
 final  List<Passenger> _waitingUp;
@override@JsonKey() List<Passenger> get waitingUp {
  if (_waitingUp is EqualUnmodifiableListView) return _waitingUp;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_waitingUp);
}

 final  List<Passenger> _waitingDown;
@override@JsonKey() List<Passenger> get waitingDown {
  if (_waitingDown is EqualUnmodifiableListView) return _waitingDown;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_waitingDown);
}

@override@JsonKey() final  bool callUpLit;
@override@JsonKey() final  bool callDownLit;

/// Create a copy of Floor
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FloorCopyWith<_Floor> get copyWith => __$FloorCopyWithImpl<_Floor>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Floor&&(identical(other.floorNumber, floorNumber) || other.floorNumber == floorNumber)&&const DeepCollectionEquality().equals(other._waitingUp, _waitingUp)&&const DeepCollectionEquality().equals(other._waitingDown, _waitingDown)&&(identical(other.callUpLit, callUpLit) || other.callUpLit == callUpLit)&&(identical(other.callDownLit, callDownLit) || other.callDownLit == callDownLit));
}


@override
int get hashCode => Object.hash(runtimeType,floorNumber,const DeepCollectionEquality().hash(_waitingUp),const DeepCollectionEquality().hash(_waitingDown),callUpLit,callDownLit);

@override
String toString() {
  return 'Floor(floorNumber: $floorNumber, waitingUp: $waitingUp, waitingDown: $waitingDown, callUpLit: $callUpLit, callDownLit: $callDownLit)';
}


}

/// @nodoc
abstract mixin class _$FloorCopyWith<$Res> implements $FloorCopyWith<$Res> {
  factory _$FloorCopyWith(_Floor value, $Res Function(_Floor) _then) = __$FloorCopyWithImpl;
@override @useResult
$Res call({
 int floorNumber, List<Passenger> waitingUp, List<Passenger> waitingDown, bool callUpLit, bool callDownLit
});




}
/// @nodoc
class __$FloorCopyWithImpl<$Res>
    implements _$FloorCopyWith<$Res> {
  __$FloorCopyWithImpl(this._self, this._then);

  final _Floor _self;
  final $Res Function(_Floor) _then;

/// Create a copy of Floor
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? floorNumber = null,Object? waitingUp = null,Object? waitingDown = null,Object? callUpLit = null,Object? callDownLit = null,}) {
  return _then(_Floor(
floorNumber: null == floorNumber ? _self.floorNumber : floorNumber // ignore: cast_nullable_to_non_nullable
as int,waitingUp: null == waitingUp ? _self._waitingUp : waitingUp // ignore: cast_nullable_to_non_nullable
as List<Passenger>,waitingDown: null == waitingDown ? _self._waitingDown : waitingDown // ignore: cast_nullable_to_non_nullable
as List<Passenger>,callUpLit: null == callUpLit ? _self.callUpLit : callUpLit // ignore: cast_nullable_to_non_nullable
as bool,callDownLit: null == callDownLit ? _self.callDownLit : callDownLit // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc
mixin _$GameState {

 List<Elevator> get elevators; List<Floor> get floors; List<Passenger> get allPassengers; int get score; bool get isGameOver; Duration get elapsedGameTime;
/// Create a copy of GameState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GameStateCopyWith<GameState> get copyWith => _$GameStateCopyWithImpl<GameState>(this as GameState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GameState&&const DeepCollectionEquality().equals(other.elevators, elevators)&&const DeepCollectionEquality().equals(other.floors, floors)&&const DeepCollectionEquality().equals(other.allPassengers, allPassengers)&&(identical(other.score, score) || other.score == score)&&(identical(other.isGameOver, isGameOver) || other.isGameOver == isGameOver)&&(identical(other.elapsedGameTime, elapsedGameTime) || other.elapsedGameTime == elapsedGameTime));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(elevators),const DeepCollectionEquality().hash(floors),const DeepCollectionEquality().hash(allPassengers),score,isGameOver,elapsedGameTime);

@override
String toString() {
  return 'GameState(elevators: $elevators, floors: $floors, allPassengers: $allPassengers, score: $score, isGameOver: $isGameOver, elapsedGameTime: $elapsedGameTime)';
}


}

/// @nodoc
abstract mixin class $GameStateCopyWith<$Res>  {
  factory $GameStateCopyWith(GameState value, $Res Function(GameState) _then) = _$GameStateCopyWithImpl;
@useResult
$Res call({
 List<Elevator> elevators, List<Floor> floors, List<Passenger> allPassengers, int score, bool isGameOver, Duration elapsedGameTime
});




}
/// @nodoc
class _$GameStateCopyWithImpl<$Res>
    implements $GameStateCopyWith<$Res> {
  _$GameStateCopyWithImpl(this._self, this._then);

  final GameState _self;
  final $Res Function(GameState) _then;

/// Create a copy of GameState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? elevators = null,Object? floors = null,Object? allPassengers = null,Object? score = null,Object? isGameOver = null,Object? elapsedGameTime = null,}) {
  return _then(_self.copyWith(
elevators: null == elevators ? _self.elevators : elevators // ignore: cast_nullable_to_non_nullable
as List<Elevator>,floors: null == floors ? _self.floors : floors // ignore: cast_nullable_to_non_nullable
as List<Floor>,allPassengers: null == allPassengers ? _self.allPassengers : allPassengers // ignore: cast_nullable_to_non_nullable
as List<Passenger>,score: null == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as int,isGameOver: null == isGameOver ? _self.isGameOver : isGameOver // ignore: cast_nullable_to_non_nullable
as bool,elapsedGameTime: null == elapsedGameTime ? _self.elapsedGameTime : elapsedGameTime // ignore: cast_nullable_to_non_nullable
as Duration,
  ));
}

}


/// @nodoc


class _GameState implements GameState {
  const _GameState({required final  List<Elevator> elevators, required final  List<Floor> floors, required final  List<Passenger> allPassengers, required this.score, required this.isGameOver, required this.elapsedGameTime}): _elevators = elevators,_floors = floors,_allPassengers = allPassengers;
  

 final  List<Elevator> _elevators;
@override List<Elevator> get elevators {
  if (_elevators is EqualUnmodifiableListView) return _elevators;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_elevators);
}

 final  List<Floor> _floors;
@override List<Floor> get floors {
  if (_floors is EqualUnmodifiableListView) return _floors;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_floors);
}

 final  List<Passenger> _allPassengers;
@override List<Passenger> get allPassengers {
  if (_allPassengers is EqualUnmodifiableListView) return _allPassengers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_allPassengers);
}

@override final  int score;
@override final  bool isGameOver;
@override final  Duration elapsedGameTime;

/// Create a copy of GameState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GameStateCopyWith<_GameState> get copyWith => __$GameStateCopyWithImpl<_GameState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GameState&&const DeepCollectionEquality().equals(other._elevators, _elevators)&&const DeepCollectionEquality().equals(other._floors, _floors)&&const DeepCollectionEquality().equals(other._allPassengers, _allPassengers)&&(identical(other.score, score) || other.score == score)&&(identical(other.isGameOver, isGameOver) || other.isGameOver == isGameOver)&&(identical(other.elapsedGameTime, elapsedGameTime) || other.elapsedGameTime == elapsedGameTime));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_elevators),const DeepCollectionEquality().hash(_floors),const DeepCollectionEquality().hash(_allPassengers),score,isGameOver,elapsedGameTime);

@override
String toString() {
  return 'GameState(elevators: $elevators, floors: $floors, allPassengers: $allPassengers, score: $score, isGameOver: $isGameOver, elapsedGameTime: $elapsedGameTime)';
}


}

/// @nodoc
abstract mixin class _$GameStateCopyWith<$Res> implements $GameStateCopyWith<$Res> {
  factory _$GameStateCopyWith(_GameState value, $Res Function(_GameState) _then) = __$GameStateCopyWithImpl;
@override @useResult
$Res call({
 List<Elevator> elevators, List<Floor> floors, List<Passenger> allPassengers, int score, bool isGameOver, Duration elapsedGameTime
});




}
/// @nodoc
class __$GameStateCopyWithImpl<$Res>
    implements _$GameStateCopyWith<$Res> {
  __$GameStateCopyWithImpl(this._self, this._then);

  final _GameState _self;
  final $Res Function(_GameState) _then;

/// Create a copy of GameState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? elevators = null,Object? floors = null,Object? allPassengers = null,Object? score = null,Object? isGameOver = null,Object? elapsedGameTime = null,}) {
  return _then(_GameState(
elevators: null == elevators ? _self._elevators : elevators // ignore: cast_nullable_to_non_nullable
as List<Elevator>,floors: null == floors ? _self._floors : floors // ignore: cast_nullable_to_non_nullable
as List<Floor>,allPassengers: null == allPassengers ? _self._allPassengers : allPassengers // ignore: cast_nullable_to_non_nullable
as List<Passenger>,score: null == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as int,isGameOver: null == isGameOver ? _self.isGameOver : isGameOver // ignore: cast_nullable_to_non_nullable
as bool,elapsedGameTime: null == elapsedGameTime ? _self.elapsedGameTime : elapsedGameTime // ignore: cast_nullable_to_non_nullable
as Duration,
  ));
}


}

// dart format on
