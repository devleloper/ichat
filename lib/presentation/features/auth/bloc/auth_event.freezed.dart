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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( AuthCheckSessionEvent value)?  checkSession,TResult Function( AuthLoadUsersEvent value)?  loadUsers,TResult Function( AuthCreateUserEvent value)?  createUser,TResult Function( AuthSelectUserEvent value)?  selectUser,TResult Function( AuthLogoutEvent value)?  logout,required TResult orElse(),}){
final _that = this;
switch (_that) {
case AuthCheckSessionEvent() when checkSession != null:
return checkSession(_that);case AuthLoadUsersEvent() when loadUsers != null:
return loadUsers(_that);case AuthCreateUserEvent() when createUser != null:
return createUser(_that);case AuthSelectUserEvent() when selectUser != null:
return selectUser(_that);case AuthLogoutEvent() when logout != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( AuthCheckSessionEvent value)  checkSession,required TResult Function( AuthLoadUsersEvent value)  loadUsers,required TResult Function( AuthCreateUserEvent value)  createUser,required TResult Function( AuthSelectUserEvent value)  selectUser,required TResult Function( AuthLogoutEvent value)  logout,}){
final _that = this;
switch (_that) {
case AuthCheckSessionEvent():
return checkSession(_that);case AuthLoadUsersEvent():
return loadUsers(_that);case AuthCreateUserEvent():
return createUser(_that);case AuthSelectUserEvent():
return selectUser(_that);case AuthLogoutEvent():
return logout(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( AuthCheckSessionEvent value)?  checkSession,TResult? Function( AuthLoadUsersEvent value)?  loadUsers,TResult? Function( AuthCreateUserEvent value)?  createUser,TResult? Function( AuthSelectUserEvent value)?  selectUser,TResult? Function( AuthLogoutEvent value)?  logout,}){
final _that = this;
switch (_that) {
case AuthCheckSessionEvent() when checkSession != null:
return checkSession(_that);case AuthLoadUsersEvent() when loadUsers != null:
return loadUsers(_that);case AuthCreateUserEvent() when createUser != null:
return createUser(_that);case AuthSelectUserEvent() when selectUser != null:
return selectUser(_that);case AuthLogoutEvent() when logout != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  checkSession,TResult Function()?  loadUsers,TResult Function( String name)?  createUser,TResult Function( User user)?  selectUser,TResult Function()?  logout,required TResult orElse(),}) {final _that = this;
switch (_that) {
case AuthCheckSessionEvent() when checkSession != null:
return checkSession();case AuthLoadUsersEvent() when loadUsers != null:
return loadUsers();case AuthCreateUserEvent() when createUser != null:
return createUser(_that.name);case AuthSelectUserEvent() when selectUser != null:
return selectUser(_that.user);case AuthLogoutEvent() when logout != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  checkSession,required TResult Function()  loadUsers,required TResult Function( String name)  createUser,required TResult Function( User user)  selectUser,required TResult Function()  logout,}) {final _that = this;
switch (_that) {
case AuthCheckSessionEvent():
return checkSession();case AuthLoadUsersEvent():
return loadUsers();case AuthCreateUserEvent():
return createUser(_that.name);case AuthSelectUserEvent():
return selectUser(_that.user);case AuthLogoutEvent():
return logout();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  checkSession,TResult? Function()?  loadUsers,TResult? Function( String name)?  createUser,TResult? Function( User user)?  selectUser,TResult? Function()?  logout,}) {final _that = this;
switch (_that) {
case AuthCheckSessionEvent() when checkSession != null:
return checkSession();case AuthLoadUsersEvent() when loadUsers != null:
return loadUsers();case AuthCreateUserEvent() when createUser != null:
return createUser(_that.name);case AuthSelectUserEvent() when selectUser != null:
return selectUser(_that.user);case AuthLogoutEvent() when logout != null:
return logout();case _:
  return null;

}
}

}

/// @nodoc


class AuthCheckSessionEvent implements AuthEvent {
  const AuthCheckSessionEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthCheckSessionEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthEvent.checkSession()';
}


}




/// @nodoc


class AuthLoadUsersEvent implements AuthEvent {
  const AuthLoadUsersEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthLoadUsersEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthEvent.loadUsers()';
}


}




/// @nodoc


class AuthCreateUserEvent implements AuthEvent {
  const AuthCreateUserEvent(this.name);
  

 final  String name;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthCreateUserEventCopyWith<AuthCreateUserEvent> get copyWith => _$AuthCreateUserEventCopyWithImpl<AuthCreateUserEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthCreateUserEvent&&(identical(other.name, name) || other.name == name));
}


@override
int get hashCode => Object.hash(runtimeType,name);

@override
String toString() {
  return 'AuthEvent.createUser(name: $name)';
}


}

/// @nodoc
abstract mixin class $AuthCreateUserEventCopyWith<$Res> implements $AuthEventCopyWith<$Res> {
  factory $AuthCreateUserEventCopyWith(AuthCreateUserEvent value, $Res Function(AuthCreateUserEvent) _then) = _$AuthCreateUserEventCopyWithImpl;
@useResult
$Res call({
 String name
});




}
/// @nodoc
class _$AuthCreateUserEventCopyWithImpl<$Res>
    implements $AuthCreateUserEventCopyWith<$Res> {
  _$AuthCreateUserEventCopyWithImpl(this._self, this._then);

  final AuthCreateUserEvent _self;
  final $Res Function(AuthCreateUserEvent) _then;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? name = null,}) {
  return _then(AuthCreateUserEvent(
null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class AuthSelectUserEvent implements AuthEvent {
  const AuthSelectUserEvent(this.user);
  

 final  User user;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthSelectUserEventCopyWith<AuthSelectUserEvent> get copyWith => _$AuthSelectUserEventCopyWithImpl<AuthSelectUserEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthSelectUserEvent&&(identical(other.user, user) || other.user == user));
}


@override
int get hashCode => Object.hash(runtimeType,user);

@override
String toString() {
  return 'AuthEvent.selectUser(user: $user)';
}


}

/// @nodoc
abstract mixin class $AuthSelectUserEventCopyWith<$Res> implements $AuthEventCopyWith<$Res> {
  factory $AuthSelectUserEventCopyWith(AuthSelectUserEvent value, $Res Function(AuthSelectUserEvent) _then) = _$AuthSelectUserEventCopyWithImpl;
@useResult
$Res call({
 User user
});


$UserCopyWith<$Res> get user;

}
/// @nodoc
class _$AuthSelectUserEventCopyWithImpl<$Res>
    implements $AuthSelectUserEventCopyWith<$Res> {
  _$AuthSelectUserEventCopyWithImpl(this._self, this._then);

  final AuthSelectUserEvent _self;
  final $Res Function(AuthSelectUserEvent) _then;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? user = null,}) {
  return _then(AuthSelectUserEvent(
null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User,
  ));
}

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res> get user {
  
  return $UserCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}

/// @nodoc


class AuthLogoutEvent implements AuthEvent {
  const AuthLogoutEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthLogoutEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthEvent.logout()';
}


}




// dart format on
