// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ws_event_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WsEventDto {

 String get type;@JsonKey(name: 'room_id') String? get roomId;@JsonKey(name: 'user_id') String? get userId; String? get text;@JsonKey(name: 'client_message_id') String? get clientMessageId; MessageDto? get message; String? get error;
/// Create a copy of WsEventDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WsEventDtoCopyWith<WsEventDto> get copyWith => _$WsEventDtoCopyWithImpl<WsEventDto>(this as WsEventDto, _$identity);

  /// Serializes this WsEventDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WsEventDto&&(identical(other.type, type) || other.type == type)&&(identical(other.roomId, roomId) || other.roomId == roomId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.text, text) || other.text == text)&&(identical(other.clientMessageId, clientMessageId) || other.clientMessageId == clientMessageId)&&(identical(other.message, message) || other.message == message)&&(identical(other.error, error) || other.error == error));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,roomId,userId,text,clientMessageId,message,error);

@override
String toString() {
  return 'WsEventDto(type: $type, roomId: $roomId, userId: $userId, text: $text, clientMessageId: $clientMessageId, message: $message, error: $error)';
}


}

/// @nodoc
abstract mixin class $WsEventDtoCopyWith<$Res>  {
  factory $WsEventDtoCopyWith(WsEventDto value, $Res Function(WsEventDto) _then) = _$WsEventDtoCopyWithImpl;
@useResult
$Res call({
 String type,@JsonKey(name: 'room_id') String? roomId,@JsonKey(name: 'user_id') String? userId, String? text,@JsonKey(name: 'client_message_id') String? clientMessageId, MessageDto? message, String? error
});


$MessageDtoCopyWith<$Res>? get message;

}
/// @nodoc
class _$WsEventDtoCopyWithImpl<$Res>
    implements $WsEventDtoCopyWith<$Res> {
  _$WsEventDtoCopyWithImpl(this._self, this._then);

  final WsEventDto _self;
  final $Res Function(WsEventDto) _then;

/// Create a copy of WsEventDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = null,Object? roomId = freezed,Object? userId = freezed,Object? text = freezed,Object? clientMessageId = freezed,Object? message = freezed,Object? error = freezed,}) {
  return _then(WsEventDto(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,roomId: freezed == roomId ? _self.roomId : roomId // ignore: cast_nullable_to_non_nullable
as String?,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,text: freezed == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String?,clientMessageId: freezed == clientMessageId ? _self.clientMessageId : clientMessageId // ignore: cast_nullable_to_non_nullable
as String?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as MessageDto?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of WsEventDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MessageDtoCopyWith<$Res>? get message {
    if (_self.message == null) {
    return null;
  }

  return $MessageDtoCopyWith<$Res>(_self.message!, (value) {
    return _then(_self.copyWith(message: value));
  });
}
}


/// Adds pattern-matching-related methods to [WsEventDto].
extension WsEventDtoPatterns on WsEventDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WsEventDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WsEventDto() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WsEventDto value)  $default,){
final _that = this;
switch (_that) {
case _WsEventDto():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WsEventDto value)?  $default,){
final _that = this;
switch (_that) {
case _WsEventDto() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String type, @JsonKey(name: 'room_id')  String? roomId, @JsonKey(name: 'user_id')  String? userId,  String? text, @JsonKey(name: 'client_message_id')  String? clientMessageId,  MessageDto? message,  String? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WsEventDto() when $default != null:
return $default(_that.type,_that.roomId,_that.userId,_that.text,_that.clientMessageId,_that.message,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String type, @JsonKey(name: 'room_id')  String? roomId, @JsonKey(name: 'user_id')  String? userId,  String? text, @JsonKey(name: 'client_message_id')  String? clientMessageId,  MessageDto? message,  String? error)  $default,) {final _that = this;
switch (_that) {
case _WsEventDto():
return $default(_that.type,_that.roomId,_that.userId,_that.text,_that.clientMessageId,_that.message,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String type, @JsonKey(name: 'room_id')  String? roomId, @JsonKey(name: 'user_id')  String? userId,  String? text, @JsonKey(name: 'client_message_id')  String? clientMessageId,  MessageDto? message,  String? error)?  $default,) {final _that = this;
switch (_that) {
case _WsEventDto() when $default != null:
return $default(_that.type,_that.roomId,_that.userId,_that.text,_that.clientMessageId,_that.message,_that.error);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WsEventDto implements WsEventDto {
  const _WsEventDto({required this.type, @JsonKey(name: 'room_id') this.roomId, @JsonKey(name: 'user_id') this.userId, this.text, @JsonKey(name: 'client_message_id') this.clientMessageId, this.message, this.error});
  factory _WsEventDto.fromJson(Map<String, dynamic> json) => _$WsEventDtoFromJson(json);

@override final  String type;
@override@JsonKey(name: 'room_id') final  String? roomId;
@override@JsonKey(name: 'user_id') final  String? userId;
@override final  String? text;
@override@JsonKey(name: 'client_message_id') final  String? clientMessageId;
@override final  MessageDto? message;
@override final  String? error;

/// Create a copy of WsEventDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WsEventDtoCopyWith<_WsEventDto> get copyWith => __$WsEventDtoCopyWithImpl<_WsEventDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WsEventDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WsEventDto&&(identical(other.type, type) || other.type == type)&&(identical(other.roomId, roomId) || other.roomId == roomId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.text, text) || other.text == text)&&(identical(other.clientMessageId, clientMessageId) || other.clientMessageId == clientMessageId)&&(identical(other.message, message) || other.message == message)&&(identical(other.error, error) || other.error == error));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,roomId,userId,text,clientMessageId,message,error);

@override
String toString() {
  return 'WsEventDto(type: $type, roomId: $roomId, userId: $userId, text: $text, clientMessageId: $clientMessageId, message: $message, error: $error)';
}


}

/// @nodoc
abstract mixin class _$WsEventDtoCopyWith<$Res> implements $WsEventDtoCopyWith<$Res> {
  factory _$WsEventDtoCopyWith(_WsEventDto value, $Res Function(_WsEventDto) _then) = __$WsEventDtoCopyWithImpl;
@override @useResult
$Res call({
 String type,@JsonKey(name: 'room_id') String? roomId,@JsonKey(name: 'user_id') String? userId, String? text,@JsonKey(name: 'client_message_id') String? clientMessageId, MessageDto? message, String? error
});


@override $MessageDtoCopyWith<$Res>? get message;

}
/// @nodoc
class __$WsEventDtoCopyWithImpl<$Res>
    implements _$WsEventDtoCopyWith<$Res> {
  __$WsEventDtoCopyWithImpl(this._self, this._then);

  final _WsEventDto _self;
  final $Res Function(_WsEventDto) _then;

/// Create a copy of WsEventDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? roomId = freezed,Object? userId = freezed,Object? text = freezed,Object? clientMessageId = freezed,Object? message = freezed,Object? error = freezed,}) {
  return _then(_WsEventDto(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,roomId: freezed == roomId ? _self.roomId : roomId // ignore: cast_nullable_to_non_nullable
as String?,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,text: freezed == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String?,clientMessageId: freezed == clientMessageId ? _self.clientMessageId : clientMessageId // ignore: cast_nullable_to_non_nullable
as String?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as MessageDto?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of WsEventDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MessageDtoCopyWith<$Res>? get message {
    if (_self.message == null) {
    return null;
  }

  return $MessageDtoCopyWith<$Res>(_self.message!, (value) {
    return _then(_self.copyWith(message: value));
  });
}
}

// dart format on
