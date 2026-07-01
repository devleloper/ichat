// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_room_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ChatRoomEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatRoomEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChatRoomEvent()';
}


}

/// @nodoc
class $ChatRoomEventCopyWith<$Res>  {
$ChatRoomEventCopyWith(ChatRoomEvent _, $Res Function(ChatRoomEvent) __);
}


/// Adds pattern-matching-related methods to [ChatRoomEvent].
extension ChatRoomEventPatterns on ChatRoomEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LoadMessagesEvent value)?  loadMessages,TResult Function( SendMessageEvent value)?  sendMessage,TResult Function( MessageReceivedEvent value)?  messageReceived,TResult Function( MessageErrorEvent value)?  messageError,TResult Function( SendTypingEvent value)?  sendTyping,TResult Function( UserTypingEvent value)?  userTyping,TResult Function( ResetTypingEvent value)?  resetTyping,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LoadMessagesEvent() when loadMessages != null:
return loadMessages(_that);case SendMessageEvent() when sendMessage != null:
return sendMessage(_that);case MessageReceivedEvent() when messageReceived != null:
return messageReceived(_that);case MessageErrorEvent() when messageError != null:
return messageError(_that);case SendTypingEvent() when sendTyping != null:
return sendTyping(_that);case UserTypingEvent() when userTyping != null:
return userTyping(_that);case ResetTypingEvent() when resetTyping != null:
return resetTyping(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LoadMessagesEvent value)  loadMessages,required TResult Function( SendMessageEvent value)  sendMessage,required TResult Function( MessageReceivedEvent value)  messageReceived,required TResult Function( MessageErrorEvent value)  messageError,required TResult Function( SendTypingEvent value)  sendTyping,required TResult Function( UserTypingEvent value)  userTyping,required TResult Function( ResetTypingEvent value)  resetTyping,}){
final _that = this;
switch (_that) {
case LoadMessagesEvent():
return loadMessages(_that);case SendMessageEvent():
return sendMessage(_that);case MessageReceivedEvent():
return messageReceived(_that);case MessageErrorEvent():
return messageError(_that);case SendTypingEvent():
return sendTyping(_that);case UserTypingEvent():
return userTyping(_that);case ResetTypingEvent():
return resetTyping(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LoadMessagesEvent value)?  loadMessages,TResult? Function( SendMessageEvent value)?  sendMessage,TResult? Function( MessageReceivedEvent value)?  messageReceived,TResult? Function( MessageErrorEvent value)?  messageError,TResult? Function( SendTypingEvent value)?  sendTyping,TResult? Function( UserTypingEvent value)?  userTyping,TResult? Function( ResetTypingEvent value)?  resetTyping,}){
final _that = this;
switch (_that) {
case LoadMessagesEvent() when loadMessages != null:
return loadMessages(_that);case SendMessageEvent() when sendMessage != null:
return sendMessage(_that);case MessageReceivedEvent() when messageReceived != null:
return messageReceived(_that);case MessageErrorEvent() when messageError != null:
return messageError(_that);case SendTypingEvent() when sendTyping != null:
return sendTyping(_that);case UserTypingEvent() when userTyping != null:
return userTyping(_that);case ResetTypingEvent() when resetTyping != null:
return resetTyping(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loadMessages,TResult Function( String text)?  sendMessage,TResult Function( Message message)?  messageReceived,TResult Function( String clientMessageId,  String error)?  messageError,TResult Function()?  sendTyping,TResult Function( String userId)?  userTyping,TResult Function()?  resetTyping,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LoadMessagesEvent() when loadMessages != null:
return loadMessages();case SendMessageEvent() when sendMessage != null:
return sendMessage(_that.text);case MessageReceivedEvent() when messageReceived != null:
return messageReceived(_that.message);case MessageErrorEvent() when messageError != null:
return messageError(_that.clientMessageId,_that.error);case SendTypingEvent() when sendTyping != null:
return sendTyping();case UserTypingEvent() when userTyping != null:
return userTyping(_that.userId);case ResetTypingEvent() when resetTyping != null:
return resetTyping();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loadMessages,required TResult Function( String text)  sendMessage,required TResult Function( Message message)  messageReceived,required TResult Function( String clientMessageId,  String error)  messageError,required TResult Function()  sendTyping,required TResult Function( String userId)  userTyping,required TResult Function()  resetTyping,}) {final _that = this;
switch (_that) {
case LoadMessagesEvent():
return loadMessages();case SendMessageEvent():
return sendMessage(_that.text);case MessageReceivedEvent():
return messageReceived(_that.message);case MessageErrorEvent():
return messageError(_that.clientMessageId,_that.error);case SendTypingEvent():
return sendTyping();case UserTypingEvent():
return userTyping(_that.userId);case ResetTypingEvent():
return resetTyping();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loadMessages,TResult? Function( String text)?  sendMessage,TResult? Function( Message message)?  messageReceived,TResult? Function( String clientMessageId,  String error)?  messageError,TResult? Function()?  sendTyping,TResult? Function( String userId)?  userTyping,TResult? Function()?  resetTyping,}) {final _that = this;
switch (_that) {
case LoadMessagesEvent() when loadMessages != null:
return loadMessages();case SendMessageEvent() when sendMessage != null:
return sendMessage(_that.text);case MessageReceivedEvent() when messageReceived != null:
return messageReceived(_that.message);case MessageErrorEvent() when messageError != null:
return messageError(_that.clientMessageId,_that.error);case SendTypingEvent() when sendTyping != null:
return sendTyping();case UserTypingEvent() when userTyping != null:
return userTyping(_that.userId);case ResetTypingEvent() when resetTyping != null:
return resetTyping();case _:
  return null;

}
}

}

/// @nodoc


class LoadMessagesEvent implements ChatRoomEvent {
  const LoadMessagesEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadMessagesEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChatRoomEvent.loadMessages()';
}


}




/// @nodoc


class SendMessageEvent implements ChatRoomEvent {
  const SendMessageEvent(this.text);
  

 final  String text;

/// Create a copy of ChatRoomEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SendMessageEventCopyWith<SendMessageEvent> get copyWith => _$SendMessageEventCopyWithImpl<SendMessageEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SendMessageEvent&&(identical(other.text, text) || other.text == text));
}


@override
int get hashCode => Object.hash(runtimeType,text);

@override
String toString() {
  return 'ChatRoomEvent.sendMessage(text: $text)';
}


}

/// @nodoc
abstract mixin class $SendMessageEventCopyWith<$Res> implements $ChatRoomEventCopyWith<$Res> {
  factory $SendMessageEventCopyWith(SendMessageEvent value, $Res Function(SendMessageEvent) _then) = _$SendMessageEventCopyWithImpl;
@useResult
$Res call({
 String text
});




}
/// @nodoc
class _$SendMessageEventCopyWithImpl<$Res>
    implements $SendMessageEventCopyWith<$Res> {
  _$SendMessageEventCopyWithImpl(this._self, this._then);

  final SendMessageEvent _self;
  final $Res Function(SendMessageEvent) _then;

/// Create a copy of ChatRoomEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? text = null,}) {
  return _then(SendMessageEvent(
null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class MessageReceivedEvent implements ChatRoomEvent {
  const MessageReceivedEvent(this.message);
  

 final  Message message;

/// Create a copy of ChatRoomEvent
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
  return 'ChatRoomEvent.messageReceived(message: $message)';
}


}

/// @nodoc
abstract mixin class $MessageReceivedEventCopyWith<$Res> implements $ChatRoomEventCopyWith<$Res> {
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

/// Create a copy of ChatRoomEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(MessageReceivedEvent(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as Message,
  ));
}


}

/// @nodoc


class MessageErrorEvent implements ChatRoomEvent {
  const MessageErrorEvent(this.clientMessageId, this.error);
  

 final  String clientMessageId;
 final  String error;

/// Create a copy of ChatRoomEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MessageErrorEventCopyWith<MessageErrorEvent> get copyWith => _$MessageErrorEventCopyWithImpl<MessageErrorEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MessageErrorEvent&&(identical(other.clientMessageId, clientMessageId) || other.clientMessageId == clientMessageId)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,clientMessageId,error);

@override
String toString() {
  return 'ChatRoomEvent.messageError(clientMessageId: $clientMessageId, error: $error)';
}


}

/// @nodoc
abstract mixin class $MessageErrorEventCopyWith<$Res> implements $ChatRoomEventCopyWith<$Res> {
  factory $MessageErrorEventCopyWith(MessageErrorEvent value, $Res Function(MessageErrorEvent) _then) = _$MessageErrorEventCopyWithImpl;
@useResult
$Res call({
 String clientMessageId, String error
});




}
/// @nodoc
class _$MessageErrorEventCopyWithImpl<$Res>
    implements $MessageErrorEventCopyWith<$Res> {
  _$MessageErrorEventCopyWithImpl(this._self, this._then);

  final MessageErrorEvent _self;
  final $Res Function(MessageErrorEvent) _then;

/// Create a copy of ChatRoomEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? clientMessageId = null,Object? error = null,}) {
  return _then(MessageErrorEvent(
null == clientMessageId ? _self.clientMessageId : clientMessageId // ignore: cast_nullable_to_non_nullable
as String,null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class SendTypingEvent implements ChatRoomEvent {
  const SendTypingEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SendTypingEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChatRoomEvent.sendTyping()';
}


}




/// @nodoc


class UserTypingEvent implements ChatRoomEvent {
  const UserTypingEvent(this.userId);
  

 final  String userId;

/// Create a copy of ChatRoomEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserTypingEventCopyWith<UserTypingEvent> get copyWith => _$UserTypingEventCopyWithImpl<UserTypingEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserTypingEvent&&(identical(other.userId, userId) || other.userId == userId));
}


@override
int get hashCode => Object.hash(runtimeType,userId);

@override
String toString() {
  return 'ChatRoomEvent.userTyping(userId: $userId)';
}


}

/// @nodoc
abstract mixin class $UserTypingEventCopyWith<$Res> implements $ChatRoomEventCopyWith<$Res> {
  factory $UserTypingEventCopyWith(UserTypingEvent value, $Res Function(UserTypingEvent) _then) = _$UserTypingEventCopyWithImpl;
@useResult
$Res call({
 String userId
});




}
/// @nodoc
class _$UserTypingEventCopyWithImpl<$Res>
    implements $UserTypingEventCopyWith<$Res> {
  _$UserTypingEventCopyWithImpl(this._self, this._then);

  final UserTypingEvent _self;
  final $Res Function(UserTypingEvent) _then;

/// Create a copy of ChatRoomEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? userId = null,}) {
  return _then(UserTypingEvent(
null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ResetTypingEvent implements ChatRoomEvent {
  const ResetTypingEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResetTypingEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChatRoomEvent.resetTyping()';
}


}




// dart format on
