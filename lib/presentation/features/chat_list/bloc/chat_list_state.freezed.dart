// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ChatListState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatListState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChatListState()';
}


}

/// @nodoc
class $ChatListStateCopyWith<$Res>  {
$ChatListStateCopyWith(ChatListState _, $Res Function(ChatListState) __);
}


/// Adds pattern-matching-related methods to [ChatListState].
extension ChatListStatePatterns on ChatListState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ChatListInitialState value)?  initial,TResult Function( ChatListLoadingState value)?  loading,TResult Function( LoadedState value)?  loaded,TResult Function( ChatListErrorState value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ChatListInitialState() when initial != null:
return initial(_that);case ChatListLoadingState() when loading != null:
return loading(_that);case LoadedState() when loaded != null:
return loaded(_that);case ChatListErrorState() when error != null:
return error(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ChatListInitialState value)  initial,required TResult Function( ChatListLoadingState value)  loading,required TResult Function( LoadedState value)  loaded,required TResult Function( ChatListErrorState value)  error,}){
final _that = this;
switch (_that) {
case ChatListInitialState():
return initial(_that);case ChatListLoadingState():
return loading(_that);case LoadedState():
return loaded(_that);case ChatListErrorState():
return error(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ChatListInitialState value)?  initial,TResult? Function( ChatListLoadingState value)?  loading,TResult? Function( LoadedState value)?  loaded,TResult? Function( ChatListErrorState value)?  error,}){
final _that = this;
switch (_that) {
case ChatListInitialState() when initial != null:
return initial(_that);case ChatListLoadingState() when loading != null:
return loading(_that);case LoadedState() when loaded != null:
return loaded(_that);case ChatListErrorState() when error != null:
return error(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<Room> rooms,  Map<String, User> userCache)?  loaded,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ChatListInitialState() when initial != null:
return initial();case ChatListLoadingState() when loading != null:
return loading();case LoadedState() when loaded != null:
return loaded(_that.rooms,_that.userCache);case ChatListErrorState() when error != null:
return error(_that.message);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<Room> rooms,  Map<String, User> userCache)  loaded,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case ChatListInitialState():
return initial();case ChatListLoadingState():
return loading();case LoadedState():
return loaded(_that.rooms,_that.userCache);case ChatListErrorState():
return error(_that.message);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<Room> rooms,  Map<String, User> userCache)?  loaded,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case ChatListInitialState() when initial != null:
return initial();case ChatListLoadingState() when loading != null:
return loading();case LoadedState() when loaded != null:
return loaded(_that.rooms,_that.userCache);case ChatListErrorState() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class ChatListInitialState implements ChatListState {
  const ChatListInitialState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatListInitialState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChatListState.initial()';
}


}




/// @nodoc


class ChatListLoadingState implements ChatListState {
  const ChatListLoadingState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatListLoadingState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChatListState.loading()';
}


}




/// @nodoc


class LoadedState implements ChatListState {
  const LoadedState( List<Room> rooms,  Map<String, User> userCache): _rooms = rooms,_userCache = userCache;
  

 final  List<Room> _rooms;
 List<Room> get rooms {
  if (_rooms is EqualUnmodifiableListView) return _rooms;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_rooms);
}

 final  Map<String, User> _userCache;
 Map<String, User> get userCache {
  if (_userCache is EqualUnmodifiableMapView) return _userCache;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_userCache);
}


/// Create a copy of ChatListState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadedStateCopyWith<LoadedState> get copyWith => _$LoadedStateCopyWithImpl<LoadedState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadedState&&const DeepCollectionEquality().equals(other._rooms, _rooms)&&const DeepCollectionEquality().equals(other._userCache, _userCache));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_rooms),const DeepCollectionEquality().hash(_userCache));

@override
String toString() {
  return 'ChatListState.loaded(rooms: $rooms, userCache: $userCache)';
}


}

/// @nodoc
abstract mixin class $LoadedStateCopyWith<$Res> implements $ChatListStateCopyWith<$Res> {
  factory $LoadedStateCopyWith(LoadedState value, $Res Function(LoadedState) _then) = _$LoadedStateCopyWithImpl;
@useResult
$Res call({
 List<Room> rooms, Map<String, User> userCache
});




}
/// @nodoc
class _$LoadedStateCopyWithImpl<$Res>
    implements $LoadedStateCopyWith<$Res> {
  _$LoadedStateCopyWithImpl(this._self, this._then);

  final LoadedState _self;
  final $Res Function(LoadedState) _then;

/// Create a copy of ChatListState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? rooms = null,Object? userCache = null,}) {
  return _then(LoadedState(
null == rooms ? _self._rooms : rooms // ignore: cast_nullable_to_non_nullable
as List<Room>,null == userCache ? _self._userCache : userCache // ignore: cast_nullable_to_non_nullable
as Map<String, User>,
  ));
}


}

/// @nodoc


class ChatListErrorState implements ChatListState {
  const ChatListErrorState(this.message);
  

 final  String message;

/// Create a copy of ChatListState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatListErrorStateCopyWith<ChatListErrorState> get copyWith => _$ChatListErrorStateCopyWithImpl<ChatListErrorState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatListErrorState&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'ChatListState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $ChatListErrorStateCopyWith<$Res> implements $ChatListStateCopyWith<$Res> {
  factory $ChatListErrorStateCopyWith(ChatListErrorState value, $Res Function(ChatListErrorState) _then) = _$ChatListErrorStateCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ChatListErrorStateCopyWithImpl<$Res>
    implements $ChatListErrorStateCopyWith<$Res> {
  _$ChatListErrorStateCopyWithImpl(this._self, this._then);

  final ChatListErrorState _self;
  final $Res Function(ChatListErrorState) _then;

/// Create a copy of ChatListState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(ChatListErrorState(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
