// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'incoming_ws_message_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$IncomingWsMessageDto {

 String get type; String? get text;@JsonKey(name: 'client_message_id') String? get clientMessageId;
/// Create a copy of IncomingWsMessageDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IncomingWsMessageDtoCopyWith<IncomingWsMessageDto> get copyWith => _$IncomingWsMessageDtoCopyWithImpl<IncomingWsMessageDto>(this as IncomingWsMessageDto, _$identity);

  /// Serializes this IncomingWsMessageDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IncomingWsMessageDto&&(identical(other.type, type) || other.type == type)&&(identical(other.text, text) || other.text == text)&&(identical(other.clientMessageId, clientMessageId) || other.clientMessageId == clientMessageId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,text,clientMessageId);

@override
String toString() {
  return 'IncomingWsMessageDto(type: $type, text: $text, clientMessageId: $clientMessageId)';
}


}

/// @nodoc
abstract mixin class $IncomingWsMessageDtoCopyWith<$Res>  {
  factory $IncomingWsMessageDtoCopyWith(IncomingWsMessageDto value, $Res Function(IncomingWsMessageDto) _then) = _$IncomingWsMessageDtoCopyWithImpl;
@useResult
$Res call({
 String type, String? text,@JsonKey(name: 'client_message_id') String? clientMessageId
});




}
/// @nodoc
class _$IncomingWsMessageDtoCopyWithImpl<$Res>
    implements $IncomingWsMessageDtoCopyWith<$Res> {
  _$IncomingWsMessageDtoCopyWithImpl(this._self, this._then);

  final IncomingWsMessageDto _self;
  final $Res Function(IncomingWsMessageDto) _then;

/// Create a copy of IncomingWsMessageDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = null,Object? text = freezed,Object? clientMessageId = freezed,}) {
  return _then(IncomingWsMessageDto(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,text: freezed == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String?,clientMessageId: freezed == clientMessageId ? _self.clientMessageId : clientMessageId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [IncomingWsMessageDto].
extension IncomingWsMessageDtoPatterns on IncomingWsMessageDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _IncomingWsMessageDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _IncomingWsMessageDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _IncomingWsMessageDto value)  $default,){
final _that = this;
switch (_that) {
case _IncomingWsMessageDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _IncomingWsMessageDto value)?  $default,){
final _that = this;
switch (_that) {
case _IncomingWsMessageDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String type,  String? text, @JsonKey(name: 'client_message_id')  String? clientMessageId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _IncomingWsMessageDto() when $default != null:
return $default(_that.type,_that.text,_that.clientMessageId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String type,  String? text, @JsonKey(name: 'client_message_id')  String? clientMessageId)  $default,) {final _that = this;
switch (_that) {
case _IncomingWsMessageDto():
return $default(_that.type,_that.text,_that.clientMessageId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String type,  String? text, @JsonKey(name: 'client_message_id')  String? clientMessageId)?  $default,) {final _that = this;
switch (_that) {
case _IncomingWsMessageDto() when $default != null:
return $default(_that.type,_that.text,_that.clientMessageId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _IncomingWsMessageDto implements IncomingWsMessageDto {
  const _IncomingWsMessageDto({required this.type, this.text, @JsonKey(name: 'client_message_id') this.clientMessageId});
  factory _IncomingWsMessageDto.fromJson(Map<String, dynamic> json) => _$IncomingWsMessageDtoFromJson(json);

@override final  String type;
@override final  String? text;
@override@JsonKey(name: 'client_message_id') final  String? clientMessageId;

/// Create a copy of IncomingWsMessageDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IncomingWsMessageDtoCopyWith<_IncomingWsMessageDto> get copyWith => __$IncomingWsMessageDtoCopyWithImpl<_IncomingWsMessageDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$IncomingWsMessageDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _IncomingWsMessageDto&&(identical(other.type, type) || other.type == type)&&(identical(other.text, text) || other.text == text)&&(identical(other.clientMessageId, clientMessageId) || other.clientMessageId == clientMessageId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,text,clientMessageId);

@override
String toString() {
  return 'IncomingWsMessageDto(type: $type, text: $text, clientMessageId: $clientMessageId)';
}


}

/// @nodoc
abstract mixin class _$IncomingWsMessageDtoCopyWith<$Res> implements $IncomingWsMessageDtoCopyWith<$Res> {
  factory _$IncomingWsMessageDtoCopyWith(_IncomingWsMessageDto value, $Res Function(_IncomingWsMessageDto) _then) = __$IncomingWsMessageDtoCopyWithImpl;
@override @useResult
$Res call({
 String type, String? text,@JsonKey(name: 'client_message_id') String? clientMessageId
});




}
/// @nodoc
class __$IncomingWsMessageDtoCopyWithImpl<$Res>
    implements _$IncomingWsMessageDtoCopyWith<$Res> {
  __$IncomingWsMessageDtoCopyWithImpl(this._self, this._then);

  final _IncomingWsMessageDto _self;
  final $Res Function(_IncomingWsMessageDto) _then;

/// Create a copy of IncomingWsMessageDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? text = freezed,Object? clientMessageId = freezed,}) {
  return _then(_IncomingWsMessageDto(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,text: freezed == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String?,clientMessageId: freezed == clientMessageId ? _self.clientMessageId : clientMessageId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
