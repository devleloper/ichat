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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ChatRoomLoadMessagesEvent value)?  loadMessages,TResult Function( ChatRoomSendMessageEvent value)?  sendMessage,TResult Function( ChatRoomMessageReceivedEvent value)?  messageReceived,TResult Function( ChatRoomMessageErrorEvent value)?  messageError,TResult Function( ChatRoomSendTypingEvent value)?  sendTyping,TResult Function( ChatRoomUserTypingEvent value)?  userTyping,TResult Function( ChatRoomResetTypingEvent value)?  resetTyping,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ChatRoomLoadMessagesEvent() when loadMessages != null:
return loadMessages(_that);case ChatRoomSendMessageEvent() when sendMessage != null:
return sendMessage(_that);case ChatRoomMessageReceivedEvent() when messageReceived != null:
return messageReceived(_that);case ChatRoomMessageErrorEvent() when messageError != null:
return messageError(_that);case ChatRoomSendTypingEvent() when sendTyping != null:
return sendTyping(_that);case ChatRoomUserTypingEvent() when userTyping != null:
return userTyping(_that);case ChatRoomResetTypingEvent() when resetTyping != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ChatRoomLoadMessagesEvent value)  loadMessages,required TResult Function( ChatRoomSendMessageEvent value)  sendMessage,required TResult Function( ChatRoomMessageReceivedEvent value)  messageReceived,required TResult Function( ChatRoomMessageErrorEvent value)  messageError,required TResult Function( ChatRoomSendTypingEvent value)  sendTyping,required TResult Function( ChatRoomUserTypingEvent value)  userTyping,required TResult Function( ChatRoomResetTypingEvent value)  resetTyping,}){
final _that = this;
switch (_that) {
case ChatRoomLoadMessagesEvent():
return loadMessages(_that);case ChatRoomSendMessageEvent():
return sendMessage(_that);case ChatRoomMessageReceivedEvent():
return messageReceived(_that);case ChatRoomMessageErrorEvent():
return messageError(_that);case ChatRoomSendTypingEvent():
return sendTyping(_that);case ChatRoomUserTypingEvent():
return userTyping(_that);case ChatRoomResetTypingEvent():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ChatRoomLoadMessagesEvent value)?  loadMessages,TResult? Function( ChatRoomSendMessageEvent value)?  sendMessage,TResult? Function( ChatRoomMessageReceivedEvent value)?  messageReceived,TResult? Function( ChatRoomMessageErrorEvent value)?  messageError,TResult? Function( ChatRoomSendTypingEvent value)?  sendTyping,TResult? Function( ChatRoomUserTypingEvent value)?  userTyping,TResult? Function( ChatRoomResetTypingEvent value)?  resetTyping,}){
final _that = this;
switch (_that) {
case ChatRoomLoadMessagesEvent() when loadMessages != null:
return loadMessages(_that);case ChatRoomSendMessageEvent() when sendMessage != null:
return sendMessage(_that);case ChatRoomMessageReceivedEvent() when messageReceived != null:
return messageReceived(_that);case ChatRoomMessageErrorEvent() when messageError != null:
return messageError(_that);case ChatRoomSendTypingEvent() when sendTyping != null:
return sendTyping(_that);case ChatRoomUserTypingEvent() when userTyping != null:
return userTyping(_that);case ChatRoomResetTypingEvent() when resetTyping != null:
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
case ChatRoomLoadMessagesEvent() when loadMessages != null:
return loadMessages();case ChatRoomSendMessageEvent() when sendMessage != null:
return sendMessage(_that.text);case ChatRoomMessageReceivedEvent() when messageReceived != null:
return messageReceived(_that.message);case ChatRoomMessageErrorEvent() when messageError != null:
return messageError(_that.clientMessageId,_that.error);case ChatRoomSendTypingEvent() when sendTyping != null:
return sendTyping();case ChatRoomUserTypingEvent() when userTyping != null:
return userTyping(_that.userId);case ChatRoomResetTypingEvent() when resetTyping != null:
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
case ChatRoomLoadMessagesEvent():
return loadMessages();case ChatRoomSendMessageEvent():
return sendMessage(_that.text);case ChatRoomMessageReceivedEvent():
return messageReceived(_that.message);case ChatRoomMessageErrorEvent():
return messageError(_that.clientMessageId,_that.error);case ChatRoomSendTypingEvent():
return sendTyping();case ChatRoomUserTypingEvent():
return userTyping(_that.userId);case ChatRoomResetTypingEvent():
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
case ChatRoomLoadMessagesEvent() when loadMessages != null:
return loadMessages();case ChatRoomSendMessageEvent() when sendMessage != null:
return sendMessage(_that.text);case ChatRoomMessageReceivedEvent() when messageReceived != null:
return messageReceived(_that.message);case ChatRoomMessageErrorEvent() when messageError != null:
return messageError(_that.clientMessageId,_that.error);case ChatRoomSendTypingEvent() when sendTyping != null:
return sendTyping();case ChatRoomUserTypingEvent() when userTyping != null:
return userTyping(_that.userId);case ChatRoomResetTypingEvent() when resetTyping != null:
return resetTyping();case _:
  return null;

}
}

}

/// @nodoc


class ChatRoomLoadMessagesEvent implements ChatRoomEvent {
  const ChatRoomLoadMessagesEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatRoomLoadMessagesEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChatRoomEvent.loadMessages()';
}


}




/// @nodoc


class ChatRoomSendMessageEvent implements ChatRoomEvent {
  const ChatRoomSendMessageEvent(this.text);
  

 final  String text;

/// Create a copy of ChatRoomEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatRoomSendMessageEventCopyWith<ChatRoomSendMessageEvent> get copyWith => _$ChatRoomSendMessageEventCopyWithImpl<ChatRoomSendMessageEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatRoomSendMessageEvent&&(identical(other.text, text) || other.text == text));
}


@override
int get hashCode => Object.hash(runtimeType,text);

@override
String toString() {
  return 'ChatRoomEvent.sendMessage(text: $text)';
}


}

/// @nodoc
abstract mixin class $ChatRoomSendMessageEventCopyWith<$Res> implements $ChatRoomEventCopyWith<$Res> {
  factory $ChatRoomSendMessageEventCopyWith(ChatRoomSendMessageEvent value, $Res Function(ChatRoomSendMessageEvent) _then) = _$ChatRoomSendMessageEventCopyWithImpl;
@useResult
$Res call({
 String text
});




}
/// @nodoc
class _$ChatRoomSendMessageEventCopyWithImpl<$Res>
    implements $ChatRoomSendMessageEventCopyWith<$Res> {
  _$ChatRoomSendMessageEventCopyWithImpl(this._self, this._then);

  final ChatRoomSendMessageEvent _self;
  final $Res Function(ChatRoomSendMessageEvent) _then;

/// Create a copy of ChatRoomEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? text = null,}) {
  return _then(ChatRoomSendMessageEvent(
null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ChatRoomMessageReceivedEvent implements ChatRoomEvent {
  const ChatRoomMessageReceivedEvent(this.message);
  

 final  Message message;

/// Create a copy of ChatRoomEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatRoomMessageReceivedEventCopyWith<ChatRoomMessageReceivedEvent> get copyWith => _$ChatRoomMessageReceivedEventCopyWithImpl<ChatRoomMessageReceivedEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatRoomMessageReceivedEvent&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'ChatRoomEvent.messageReceived(message: $message)';
}


}

/// @nodoc
abstract mixin class $ChatRoomMessageReceivedEventCopyWith<$Res> implements $ChatRoomEventCopyWith<$Res> {
  factory $ChatRoomMessageReceivedEventCopyWith(ChatRoomMessageReceivedEvent value, $Res Function(ChatRoomMessageReceivedEvent) _then) = _$ChatRoomMessageReceivedEventCopyWithImpl;
@useResult
$Res call({
 Message message
});


$MessageCopyWith<$Res> get message;

}
/// @nodoc
class _$ChatRoomMessageReceivedEventCopyWithImpl<$Res>
    implements $ChatRoomMessageReceivedEventCopyWith<$Res> {
  _$ChatRoomMessageReceivedEventCopyWithImpl(this._self, this._then);

  final ChatRoomMessageReceivedEvent _self;
  final $Res Function(ChatRoomMessageReceivedEvent) _then;

/// Create a copy of ChatRoomEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(ChatRoomMessageReceivedEvent(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as Message,
  ));
}

/// Create a copy of ChatRoomEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MessageCopyWith<$Res> get message {
  
  return $MessageCopyWith<$Res>(_self.message, (value) {
    return _then(_self.copyWith(message: value));
  });
}
}

/// @nodoc


class ChatRoomMessageErrorEvent implements ChatRoomEvent {
  const ChatRoomMessageErrorEvent(this.clientMessageId, this.error);
  

 final  String clientMessageId;
 final  String error;

/// Create a copy of ChatRoomEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatRoomMessageErrorEventCopyWith<ChatRoomMessageErrorEvent> get copyWith => _$ChatRoomMessageErrorEventCopyWithImpl<ChatRoomMessageErrorEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatRoomMessageErrorEvent&&(identical(other.clientMessageId, clientMessageId) || other.clientMessageId == clientMessageId)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,clientMessageId,error);

@override
String toString() {
  return 'ChatRoomEvent.messageError(clientMessageId: $clientMessageId, error: $error)';
}


}

/// @nodoc
abstract mixin class $ChatRoomMessageErrorEventCopyWith<$Res> implements $ChatRoomEventCopyWith<$Res> {
  factory $ChatRoomMessageErrorEventCopyWith(ChatRoomMessageErrorEvent value, $Res Function(ChatRoomMessageErrorEvent) _then) = _$ChatRoomMessageErrorEventCopyWithImpl;
@useResult
$Res call({
 String clientMessageId, String error
});




}
/// @nodoc
class _$ChatRoomMessageErrorEventCopyWithImpl<$Res>
    implements $ChatRoomMessageErrorEventCopyWith<$Res> {
  _$ChatRoomMessageErrorEventCopyWithImpl(this._self, this._then);

  final ChatRoomMessageErrorEvent _self;
  final $Res Function(ChatRoomMessageErrorEvent) _then;

/// Create a copy of ChatRoomEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? clientMessageId = null,Object? error = null,}) {
  return _then(ChatRoomMessageErrorEvent(
null == clientMessageId ? _self.clientMessageId : clientMessageId // ignore: cast_nullable_to_non_nullable
as String,null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ChatRoomSendTypingEvent implements ChatRoomEvent {
  const ChatRoomSendTypingEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatRoomSendTypingEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChatRoomEvent.sendTyping()';
}


}




/// @nodoc


class ChatRoomUserTypingEvent implements ChatRoomEvent {
  const ChatRoomUserTypingEvent(this.userId);
  

 final  String userId;

/// Create a copy of ChatRoomEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatRoomUserTypingEventCopyWith<ChatRoomUserTypingEvent> get copyWith => _$ChatRoomUserTypingEventCopyWithImpl<ChatRoomUserTypingEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatRoomUserTypingEvent&&(identical(other.userId, userId) || other.userId == userId));
}


@override
int get hashCode => Object.hash(runtimeType,userId);

@override
String toString() {
  return 'ChatRoomEvent.userTyping(userId: $userId)';
}


}

/// @nodoc
abstract mixin class $ChatRoomUserTypingEventCopyWith<$Res> implements $ChatRoomEventCopyWith<$Res> {
  factory $ChatRoomUserTypingEventCopyWith(ChatRoomUserTypingEvent value, $Res Function(ChatRoomUserTypingEvent) _then) = _$ChatRoomUserTypingEventCopyWithImpl;
@useResult
$Res call({
 String userId
});




}
/// @nodoc
class _$ChatRoomUserTypingEventCopyWithImpl<$Res>
    implements $ChatRoomUserTypingEventCopyWith<$Res> {
  _$ChatRoomUserTypingEventCopyWithImpl(this._self, this._then);

  final ChatRoomUserTypingEvent _self;
  final $Res Function(ChatRoomUserTypingEvent) _then;

/// Create a copy of ChatRoomEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? userId = null,}) {
  return _then(ChatRoomUserTypingEvent(
null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ChatRoomResetTypingEvent implements ChatRoomEvent {
  const ChatRoomResetTypingEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatRoomResetTypingEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChatRoomEvent.resetTyping()';
}


}




// dart format on
