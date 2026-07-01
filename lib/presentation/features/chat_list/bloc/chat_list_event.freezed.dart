// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_list_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ChatListEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatListEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChatListEvent()';
}


}

/// @nodoc
class $ChatListEventCopyWith<$Res>  {
$ChatListEventCopyWith(ChatListEvent _, $Res Function(ChatListEvent) __);
}


/// Adds pattern-matching-related methods to [ChatListEvent].
extension ChatListEventPatterns on ChatListEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LoadRoomsEvent value)?  loadRooms,TResult Function( CreateRoomEvent value)?  createRoom,TResult Function( MessageReceivedEvent value)?  messageReceived,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LoadRoomsEvent() when loadRooms != null:
return loadRooms(_that);case CreateRoomEvent() when createRoom != null:
return createRoom(_that);case MessageReceivedEvent() when messageReceived != null:
return messageReceived(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LoadRoomsEvent value)  loadRooms,required TResult Function( CreateRoomEvent value)  createRoom,required TResult Function( MessageReceivedEvent value)  messageReceived,}){
final _that = this;
switch (_that) {
case LoadRoomsEvent():
return loadRooms(_that);case CreateRoomEvent():
return createRoom(_that);case MessageReceivedEvent():
return messageReceived(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LoadRoomsEvent value)?  loadRooms,TResult? Function( CreateRoomEvent value)?  createRoom,TResult? Function( MessageReceivedEvent value)?  messageReceived,}){
final _that = this;
switch (_that) {
case LoadRoomsEvent() when loadRooms != null:
return loadRooms(_that);case CreateRoomEvent() when createRoom != null:
return createRoom(_that);case MessageReceivedEvent() when messageReceived != null:
return messageReceived(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loadRooms,TResult Function( String targetUserId)?  createRoom,TResult Function( Message message)?  messageReceived,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LoadRoomsEvent() when loadRooms != null:
return loadRooms();case CreateRoomEvent() when createRoom != null:
return createRoom(_that.targetUserId);case MessageReceivedEvent() when messageReceived != null:
return messageReceived(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loadRooms,required TResult Function( String targetUserId)  createRoom,required TResult Function( Message message)  messageReceived,}) {final _that = this;
switch (_that) {
case LoadRoomsEvent():
return loadRooms();case CreateRoomEvent():
return createRoom(_that.targetUserId);case MessageReceivedEvent():
return messageReceived(_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loadRooms,TResult? Function( String targetUserId)?  createRoom,TResult? Function( Message message)?  messageReceived,}) {final _that = this;
switch (_that) {
case LoadRoomsEvent() when loadRooms != null:
return loadRooms();case CreateRoomEvent() when createRoom != null:
return createRoom(_that.targetUserId);case MessageReceivedEvent() when messageReceived != null:
return messageReceived(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class LoadRoomsEvent implements ChatListEvent {
  const LoadRoomsEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadRoomsEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChatListEvent.loadRooms()';
}


}




/// @nodoc


class CreateRoomEvent implements ChatListEvent {
  const CreateRoomEvent(this.targetUserId);
  

 final  String targetUserId;

/// Create a copy of ChatListEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateRoomEventCopyWith<CreateRoomEvent> get copyWith => _$CreateRoomEventCopyWithImpl<CreateRoomEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateRoomEvent&&(identical(other.targetUserId, targetUserId) || other.targetUserId == targetUserId));
}


@override
int get hashCode => Object.hash(runtimeType,targetUserId);

@override
String toString() {
  return 'ChatListEvent.createRoom(targetUserId: $targetUserId)';
}


}

/// @nodoc
abstract mixin class $CreateRoomEventCopyWith<$Res> implements $ChatListEventCopyWith<$Res> {
  factory $CreateRoomEventCopyWith(CreateRoomEvent value, $Res Function(CreateRoomEvent) _then) = _$CreateRoomEventCopyWithImpl;
@useResult
$Res call({
 String targetUserId
});




}
/// @nodoc
class _$CreateRoomEventCopyWithImpl<$Res>
    implements $CreateRoomEventCopyWith<$Res> {
  _$CreateRoomEventCopyWithImpl(this._self, this._then);

  final CreateRoomEvent _self;
  final $Res Function(CreateRoomEvent) _then;

/// Create a copy of ChatListEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? targetUserId = null,}) {
  return _then(CreateRoomEvent(
null == targetUserId ? _self.targetUserId : targetUserId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class MessageReceivedEvent implements ChatListEvent {
  const MessageReceivedEvent(this.message);
  

 final  Message message;

/// Create a copy of ChatListEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MessageReceivedEventCopyWith<MessageReceivedEvent> get copyWith => _$MessageReceivedEventCopyWithImpl<MessageReceivedEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MessageReceivedEvent&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'ChatListEvent.messageReceived(message: $message)';
}


}

/// @nodoc
abstract mixin class $MessageReceivedEventCopyWith<$Res> implements $ChatListEventCopyWith<$Res> {
  factory $MessageReceivedEventCopyWith(MessageReceivedEvent value, $Res Function(MessageReceivedEvent) _then) = _$MessageReceivedEventCopyWithImpl;
@useResult
$Res call({
 Message message
});




}
/// @nodoc
class _$MessageReceivedEventCopyWithImpl<$Res>
    implements $MessageReceivedEventCopyWith<$Res> {
  _$MessageReceivedEventCopyWithImpl(this._self, this._then);

  final MessageReceivedEvent _self;
  final $Res Function(MessageReceivedEvent) _then;

/// Create a copy of ChatListEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(MessageReceivedEvent(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as Message,
  ));
}


}

// dart format on
