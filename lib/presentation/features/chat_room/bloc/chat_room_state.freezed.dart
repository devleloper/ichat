// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_room_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ChatRoomState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatRoomState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChatRoomState()';
}


}

/// @nodoc
class $ChatRoomStateCopyWith<$Res>  {
$ChatRoomStateCopyWith(ChatRoomState _, $Res Function(ChatRoomState) __);
}


/// Adds pattern-matching-related methods to [ChatRoomState].
extension ChatRoomStatePatterns on ChatRoomState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ChatRoomInitialState value)?  initial,TResult Function( ChatRoomLoadingState value)?  loading,TResult Function( ChatRoomLoadedState value)?  loaded,TResult Function( ChatRoomErrorState value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ChatRoomInitialState() when initial != null:
return initial(_that);case ChatRoomLoadingState() when loading != null:
return loading(_that);case ChatRoomLoadedState() when loaded != null:
return loaded(_that);case ChatRoomErrorState() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ChatRoomInitialState value)  initial,required TResult Function( ChatRoomLoadingState value)  loading,required TResult Function( ChatRoomLoadedState value)  loaded,required TResult Function( ChatRoomErrorState value)  error,}){
final _that = this;
switch (_that) {
case ChatRoomInitialState():
return initial(_that);case ChatRoomLoadingState():
return loading(_that);case ChatRoomLoadedState():
return loaded(_that);case ChatRoomErrorState():
return error(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ChatRoomInitialState value)?  initial,TResult? Function( ChatRoomLoadingState value)?  loading,TResult? Function( ChatRoomLoadedState value)?  loaded,TResult? Function( ChatRoomErrorState value)?  error,}){
final _that = this;
switch (_that) {
case ChatRoomInitialState() when initial != null:
return initial(_that);case ChatRoomLoadingState() when loading != null:
return loading(_that);case ChatRoomLoadedState() when loaded != null:
return loaded(_that);case ChatRoomErrorState() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<Message> messages,  String currentUserId,  bool isOtherUserTyping)?  loaded,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ChatRoomInitialState() when initial != null:
return initial();case ChatRoomLoadingState() when loading != null:
return loading();case ChatRoomLoadedState() when loaded != null:
return loaded(_that.messages,_that.currentUserId,_that.isOtherUserTyping);case ChatRoomErrorState() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<Message> messages,  String currentUserId,  bool isOtherUserTyping)  loaded,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case ChatRoomInitialState():
return initial();case ChatRoomLoadingState():
return loading();case ChatRoomLoadedState():
return loaded(_that.messages,_that.currentUserId,_that.isOtherUserTyping);case ChatRoomErrorState():
return error(_that.message);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<Message> messages,  String currentUserId,  bool isOtherUserTyping)?  loaded,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case ChatRoomInitialState() when initial != null:
return initial();case ChatRoomLoadingState() when loading != null:
return loading();case ChatRoomLoadedState() when loaded != null:
return loaded(_that.messages,_that.currentUserId,_that.isOtherUserTyping);case ChatRoomErrorState() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class ChatRoomInitialState implements ChatRoomState {
  const ChatRoomInitialState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatRoomInitialState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChatRoomState.initial()';
}


}




/// @nodoc


class ChatRoomLoadingState implements ChatRoomState {
  const ChatRoomLoadingState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatRoomLoadingState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChatRoomState.loading()';
}


}




/// @nodoc


class ChatRoomLoadedState implements ChatRoomState {
  const ChatRoomLoadedState({required  List<Message> messages, required this.currentUserId, this.isOtherUserTyping = false}): _messages = messages;
  

 final  List<Message> _messages;
 List<Message> get messages {
  if (_messages is EqualUnmodifiableListView) return _messages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_messages);
}

 final  String currentUserId;
@JsonKey() final  bool isOtherUserTyping;

/// Create a copy of ChatRoomState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatRoomLoadedStateCopyWith<ChatRoomLoadedState> get copyWith => _$ChatRoomLoadedStateCopyWithImpl<ChatRoomLoadedState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatRoomLoadedState&&const DeepCollectionEquality().equals(other._messages, _messages)&&(identical(other.currentUserId, currentUserId) || other.currentUserId == currentUserId)&&(identical(other.isOtherUserTyping, isOtherUserTyping) || other.isOtherUserTyping == isOtherUserTyping));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_messages),currentUserId,isOtherUserTyping);

@override
String toString() {
  return 'ChatRoomState.loaded(messages: $messages, currentUserId: $currentUserId, isOtherUserTyping: $isOtherUserTyping)';
}


}

/// @nodoc
abstract mixin class $ChatRoomLoadedStateCopyWith<$Res> implements $ChatRoomStateCopyWith<$Res> {
  factory $ChatRoomLoadedStateCopyWith(ChatRoomLoadedState value, $Res Function(ChatRoomLoadedState) _then) = _$ChatRoomLoadedStateCopyWithImpl;
@useResult
$Res call({
 List<Message> messages, String currentUserId, bool isOtherUserTyping
});




}
/// @nodoc
class _$ChatRoomLoadedStateCopyWithImpl<$Res>
    implements $ChatRoomLoadedStateCopyWith<$Res> {
  _$ChatRoomLoadedStateCopyWithImpl(this._self, this._then);

  final ChatRoomLoadedState _self;
  final $Res Function(ChatRoomLoadedState) _then;

/// Create a copy of ChatRoomState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? messages = null,Object? currentUserId = null,Object? isOtherUserTyping = null,}) {
  return _then(ChatRoomLoadedState(
messages: null == messages ? _self._messages : messages // ignore: cast_nullable_to_non_nullable
as List<Message>,currentUserId: null == currentUserId ? _self.currentUserId : currentUserId // ignore: cast_nullable_to_non_nullable
as String,isOtherUserTyping: null == isOtherUserTyping ? _self.isOtherUserTyping : isOtherUserTyping // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class ChatRoomErrorState implements ChatRoomState {
  const ChatRoomErrorState(this.message);
  

 final  String message;

/// Create a copy of ChatRoomState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatRoomErrorStateCopyWith<ChatRoomErrorState> get copyWith => _$ChatRoomErrorStateCopyWithImpl<ChatRoomErrorState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatRoomErrorState&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'ChatRoomState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $ChatRoomErrorStateCopyWith<$Res> implements $ChatRoomStateCopyWith<$Res> {
  factory $ChatRoomErrorStateCopyWith(ChatRoomErrorState value, $Res Function(ChatRoomErrorState) _then) = _$ChatRoomErrorStateCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ChatRoomErrorStateCopyWithImpl<$Res>
    implements $ChatRoomErrorStateCopyWith<$Res> {
  _$ChatRoomErrorStateCopyWithImpl(this._self, this._then);

  final ChatRoomErrorState _self;
  final $Res Function(ChatRoomErrorState) _then;

/// Create a copy of ChatRoomState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(ChatRoomErrorState(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
