// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'room_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RoomDto {

 String get id;@JsonKey(name: 'user_a_id') String get userAId;@JsonKey(name: 'user_b_id') String get userBId;@JsonKey(name: 'created_at') DateTime get createdAt;@JsonKey(name: 'last_message') MessageDto? get lastMessage;
/// Create a copy of RoomDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RoomDtoCopyWith<RoomDto> get copyWith => _$RoomDtoCopyWithImpl<RoomDto>(this as RoomDto, _$identity);

  /// Serializes this RoomDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RoomDto&&(identical(other.id, id) || other.id == id)&&(identical(other.userAId, userAId) || other.userAId == userAId)&&(identical(other.userBId, userBId) || other.userBId == userBId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.lastMessage, lastMessage) || other.lastMessage == lastMessage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userAId,userBId,createdAt,lastMessage);

@override
String toString() {
  return 'RoomDto(id: $id, userAId: $userAId, userBId: $userBId, createdAt: $createdAt, lastMessage: $lastMessage)';
}


}

/// @nodoc
abstract mixin class $RoomDtoCopyWith<$Res>  {
  factory $RoomDtoCopyWith(RoomDto value, $Res Function(RoomDto) _then) = _$RoomDtoCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'user_a_id') String userAId,@JsonKey(name: 'user_b_id') String userBId,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'last_message') MessageDto? lastMessage
});


$MessageDtoCopyWith<$Res>? get lastMessage;

}
/// @nodoc
class _$RoomDtoCopyWithImpl<$Res>
    implements $RoomDtoCopyWith<$Res> {
  _$RoomDtoCopyWithImpl(this._self, this._then);

  final RoomDto _self;
  final $Res Function(RoomDto) _then;

/// Create a copy of RoomDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userAId = null,Object? userBId = null,Object? createdAt = null,Object? lastMessage = freezed,}) {
  return _then(RoomDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userAId: null == userAId ? _self.userAId : userAId // ignore: cast_nullable_to_non_nullable
as String,userBId: null == userBId ? _self.userBId : userBId // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,lastMessage: freezed == lastMessage ? _self.lastMessage : lastMessage // ignore: cast_nullable_to_non_nullable
as MessageDto?,
  ));
}
/// Create a copy of RoomDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MessageDtoCopyWith<$Res>? get lastMessage {
    if (_self.lastMessage == null) {
    return null;
  }

  return $MessageDtoCopyWith<$Res>(_self.lastMessage!, (value) {
    return _then(_self.copyWith(lastMessage: value));
  });
}
}


/// Adds pattern-matching-related methods to [RoomDto].
extension RoomDtoPatterns on RoomDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RoomDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RoomDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RoomDto value)  $default,){
final _that = this;
switch (_that) {
case _RoomDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RoomDto value)?  $default,){
final _that = this;
switch (_that) {
case _RoomDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'user_a_id')  String userAId, @JsonKey(name: 'user_b_id')  String userBId, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'last_message')  MessageDto? lastMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RoomDto() when $default != null:
return $default(_that.id,_that.userAId,_that.userBId,_that.createdAt,_that.lastMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'user_a_id')  String userAId, @JsonKey(name: 'user_b_id')  String userBId, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'last_message')  MessageDto? lastMessage)  $default,) {final _that = this;
switch (_that) {
case _RoomDto():
return $default(_that.id,_that.userAId,_that.userBId,_that.createdAt,_that.lastMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'user_a_id')  String userAId, @JsonKey(name: 'user_b_id')  String userBId, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'last_message')  MessageDto? lastMessage)?  $default,) {final _that = this;
switch (_that) {
case _RoomDto() when $default != null:
return $default(_that.id,_that.userAId,_that.userBId,_that.createdAt,_that.lastMessage);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RoomDto extends RoomDto {
  const _RoomDto({required this.id, @JsonKey(name: 'user_a_id') required this.userAId, @JsonKey(name: 'user_b_id') required this.userBId, @JsonKey(name: 'created_at') required this.createdAt, @JsonKey(name: 'last_message') this.lastMessage}): super._();
  factory _RoomDto.fromJson(Map<String, dynamic> json) => _$RoomDtoFromJson(json);

@override final  String id;
@override@JsonKey(name: 'user_a_id') final  String userAId;
@override@JsonKey(name: 'user_b_id') final  String userBId;
@override@JsonKey(name: 'created_at') final  DateTime createdAt;
@override@JsonKey(name: 'last_message') final  MessageDto? lastMessage;

/// Create a copy of RoomDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RoomDtoCopyWith<_RoomDto> get copyWith => __$RoomDtoCopyWithImpl<_RoomDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RoomDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RoomDto&&(identical(other.id, id) || other.id == id)&&(identical(other.userAId, userAId) || other.userAId == userAId)&&(identical(other.userBId, userBId) || other.userBId == userBId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.lastMessage, lastMessage) || other.lastMessage == lastMessage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userAId,userBId,createdAt,lastMessage);

@override
String toString() {
  return 'RoomDto(id: $id, userAId: $userAId, userBId: $userBId, createdAt: $createdAt, lastMessage: $lastMessage)';
}


}

/// @nodoc
abstract mixin class _$RoomDtoCopyWith<$Res> implements $RoomDtoCopyWith<$Res> {
  factory _$RoomDtoCopyWith(_RoomDto value, $Res Function(_RoomDto) _then) = __$RoomDtoCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'user_a_id') String userAId,@JsonKey(name: 'user_b_id') String userBId,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'last_message') MessageDto? lastMessage
});


@override $MessageDtoCopyWith<$Res>? get lastMessage;

}
/// @nodoc
class __$RoomDtoCopyWithImpl<$Res>
    implements _$RoomDtoCopyWith<$Res> {
  __$RoomDtoCopyWithImpl(this._self, this._then);

  final _RoomDto _self;
  final $Res Function(_RoomDto) _then;

/// Create a copy of RoomDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userAId = null,Object? userBId = null,Object? createdAt = null,Object? lastMessage = freezed,}) {
  return _then(_RoomDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userAId: null == userAId ? _self.userAId : userAId // ignore: cast_nullable_to_non_nullable
as String,userBId: null == userBId ? _self.userBId : userBId // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,lastMessage: freezed == lastMessage ? _self.lastMessage : lastMessage // ignore: cast_nullable_to_non_nullable
as MessageDto?,
  ));
}

/// Create a copy of RoomDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MessageDtoCopyWith<$Res>? get lastMessage {
    if (_self.lastMessage == null) {
    return null;
  }

  return $MessageDtoCopyWith<$Res>(_self.lastMessage!, (value) {
    return _then(_self.copyWith(lastMessage: value));
  });
}
}

// dart format on
