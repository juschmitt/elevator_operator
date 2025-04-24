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
