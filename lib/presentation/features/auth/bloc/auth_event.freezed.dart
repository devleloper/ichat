// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AuthEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthEvent()';
}


}

/// @nodoc
class $AuthEventCopyWith<$Res>  {
$AuthEventCopyWith(AuthEvent _, $Res Function(AuthEvent) __);
}


/// Adds pattern-matching-related methods to [AuthEvent].
extension AuthEventPatterns on AuthEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LoadUsersEvent value)?  loadUsers,TResult Function( CreateUserEvent value)?  createUser,TResult Function( SelectUserEvent value)?  selectUser,TResult Function( LogoutEvent value)?  logout,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LoadUsersEvent() when loadUsers != null:
return loadUsers(_that);case CreateUserEvent() when createUser != null:
return createUser(_that);case SelectUserEvent() when selectUser != null:
return selectUser(_that);case LogoutEvent() when logout != null:
return logout(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LoadUsersEvent value)  loadUsers,required TResult Function( CreateUserEvent value)  createUser,required TResult Function( SelectUserEvent value)  selectUser,required TResult Function( LogoutEvent value)  logout,}){
final _that = this;
switch (_that) {
case LoadUsersEvent():
return loadUsers(_that);case CreateUserEvent():
return createUser(_that);case SelectUserEvent():
return selectUser(_that);case LogoutEvent():
return logout(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LoadUsersEvent value)?  loadUsers,TResult? Function( CreateUserEvent value)?  createUser,TResult? Function( SelectUserEvent value)?  selectUser,TResult? Function( LogoutEvent value)?  logout,}){
final _that = this;
switch (_that) {
case LoadUsersEvent() when loadUsers != null:
return loadUsers(_that);case CreateUserEvent() when createUser != null:
return createUser(_that);case SelectUserEvent() when selectUser != null:
return selectUser(_that);case LogoutEvent() when logout != null:
return logout(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loadUsers,TResult Function( String name)?  createUser,TResult Function( User user)?  selectUser,TResult Function()?  logout,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LoadUsersEvent() when loadUsers != null:
return loadUsers();case CreateUserEvent() when createUser != null:
return createUser(_that.name);case SelectUserEvent() when selectUser != null:
return selectUser(_that.user);case LogoutEvent() when logout != null:
return logout();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loadUsers,required TResult Function( String name)  createUser,required TResult Function( User user)  selectUser,required TResult Function()  logout,}) {final _that = this;
switch (_that) {
case LoadUsersEvent():
return loadUsers();case CreateUserEvent():
return createUser(_that.name);case SelectUserEvent():
return selectUser(_that.user);case LogoutEvent():
return logout();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loadUsers,TResult? Function( String name)?  createUser,TResult? Function( User user)?  selectUser,TResult? Function()?  logout,}) {final _that = this;
switch (_that) {
case LoadUsersEvent() when loadUsers != null:
return loadUsers();case CreateUserEvent() when createUser != null:
return createUser(_that.name);case SelectUserEvent() when selectUser != null:
return selectUser(_that.user);case LogoutEvent() when logout != null:
return logout();case _:
  return null;

}
}

}

/// @nodoc


class LoadUsersEvent implements AuthEvent {
  const LoadUsersEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadUsersEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthEvent.loadUsers()';
}


}




/// @nodoc


class CreateUserEvent implements AuthEvent {
  const CreateUserEvent(this.name);
  

 final  String name;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateUserEventCopyWith<CreateUserEvent> get copyWith => _$CreateUserEventCopyWithImpl<CreateUserEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateUserEvent&&(identical(other.name, name) || other.name == name));
}


@override
int get hashCode => Object.hash(runtimeType,name);

@override
String toString() {
  return 'AuthEvent.createUser(name: $name)';
}


}

/// @nodoc
abstract mixin class $CreateUserEventCopyWith<$Res> implements $AuthEventCopyWith<$Res> {
  factory $CreateUserEventCopyWith(CreateUserEvent value, $Res Function(CreateUserEvent) _then) = _$CreateUserEventCopyWithImpl;
@useResult
$Res call({
 String name
});




}
/// @nodoc
class _$CreateUserEventCopyWithImpl<$Res>
    implements $CreateUserEventCopyWith<$Res> {
  _$CreateUserEventCopyWithImpl(this._self, this._then);

  final CreateUserEvent _self;
  final $Res Function(CreateUserEvent) _then;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? name = null,}) {
  return _then(CreateUserEvent(
null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class SelectUserEvent implements AuthEvent {
  const SelectUserEvent(this.user);
  

 final  User user;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SelectUserEventCopyWith<SelectUserEvent> get copyWith => _$SelectUserEventCopyWithImpl<SelectUserEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SelectUserEvent&&(identical(other.user, user) || other.user == user));
}


@override
int get hashCode => Object.hash(runtimeType,user);

@override
String toString() {
  return 'AuthEvent.selectUser(user: $user)';
}


}

/// @nodoc
abstract mixin class $SelectUserEventCopyWith<$Res> implements $AuthEventCopyWith<$Res> {
  factory $SelectUserEventCopyWith(SelectUserEvent value, $Res Function(SelectUserEvent) _then) = _$SelectUserEventCopyWithImpl;
@useResult
$Res call({
 User user
});




}
/// @nodoc
class _$SelectUserEventCopyWithImpl<$Res>
    implements $SelectUserEventCopyWith<$Res> {
  _$SelectUserEventCopyWithImpl(this._self, this._then);

  final SelectUserEvent _self;
  final $Res Function(SelectUserEvent) _then;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? user = null,}) {
  return _then(SelectUserEvent(
null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User,
  ));
}


}

/// @nodoc


class LogoutEvent implements AuthEvent {
  const LogoutEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LogoutEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthEvent.logout()';
}


}




// dart format on
