// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AuthState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthState()';
}


}

/// @nodoc
class $AuthStateCopyWith<$Res>  {
$AuthStateCopyWith(AuthState _, $Res Function(AuthState) __);
}


/// Adds pattern-matching-related methods to [AuthState].
extension AuthStatePatterns on AuthState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( AuthInitialState value)?  initial,TResult Function( AuthLoadingState value)?  loading,TResult Function( AuthUsersLoadedState value)?  usersLoaded,TResult Function( AuthAuthenticatedState value)?  authenticated,TResult Function( AuthErrorState value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case AuthInitialState() when initial != null:
return initial(_that);case AuthLoadingState() when loading != null:
return loading(_that);case AuthUsersLoadedState() when usersLoaded != null:
return usersLoaded(_that);case AuthAuthenticatedState() when authenticated != null:
return authenticated(_that);case AuthErrorState() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( AuthInitialState value)  initial,required TResult Function( AuthLoadingState value)  loading,required TResult Function( AuthUsersLoadedState value)  usersLoaded,required TResult Function( AuthAuthenticatedState value)  authenticated,required TResult Function( AuthErrorState value)  error,}){
final _that = this;
switch (_that) {
case AuthInitialState():
return initial(_that);case AuthLoadingState():
return loading(_that);case AuthUsersLoadedState():
return usersLoaded(_that);case AuthAuthenticatedState():
return authenticated(_that);case AuthErrorState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( AuthInitialState value)?  initial,TResult? Function( AuthLoadingState value)?  loading,TResult? Function( AuthUsersLoadedState value)?  usersLoaded,TResult? Function( AuthAuthenticatedState value)?  authenticated,TResult? Function( AuthErrorState value)?  error,}){
final _that = this;
switch (_that) {
case AuthInitialState() when initial != null:
return initial(_that);case AuthLoadingState() when loading != null:
return loading(_that);case AuthUsersLoadedState() when usersLoaded != null:
return usersLoaded(_that);case AuthAuthenticatedState() when authenticated != null:
return authenticated(_that);case AuthErrorState() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<User> users)?  usersLoaded,TResult Function( User user)?  authenticated,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case AuthInitialState() when initial != null:
return initial();case AuthLoadingState() when loading != null:
return loading();case AuthUsersLoadedState() when usersLoaded != null:
return usersLoaded(_that.users);case AuthAuthenticatedState() when authenticated != null:
return authenticated(_that.user);case AuthErrorState() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<User> users)  usersLoaded,required TResult Function( User user)  authenticated,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case AuthInitialState():
return initial();case AuthLoadingState():
return loading();case AuthUsersLoadedState():
return usersLoaded(_that.users);case AuthAuthenticatedState():
return authenticated(_that.user);case AuthErrorState():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<User> users)?  usersLoaded,TResult? Function( User user)?  authenticated,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case AuthInitialState() when initial != null:
return initial();case AuthLoadingState() when loading != null:
return loading();case AuthUsersLoadedState() when usersLoaded != null:
return usersLoaded(_that.users);case AuthAuthenticatedState() when authenticated != null:
return authenticated(_that.user);case AuthErrorState() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class AuthInitialState implements AuthState {
  const AuthInitialState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthInitialState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthState.initial()';
}


}




/// @nodoc


class AuthLoadingState implements AuthState {
  const AuthLoadingState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthLoadingState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthState.loading()';
}


}




/// @nodoc


class AuthUsersLoadedState implements AuthState {
  const AuthUsersLoadedState( List<User> users): _users = users;
  

 final  List<User> _users;
 List<User> get users {
  if (_users is EqualUnmodifiableListView) return _users;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_users);
}


/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthUsersLoadedStateCopyWith<AuthUsersLoadedState> get copyWith => _$AuthUsersLoadedStateCopyWithImpl<AuthUsersLoadedState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthUsersLoadedState&&const DeepCollectionEquality().equals(other._users, _users));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_users));

@override
String toString() {
  return 'AuthState.usersLoaded(users: $users)';
}


}

/// @nodoc
abstract mixin class $AuthUsersLoadedStateCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory $AuthUsersLoadedStateCopyWith(AuthUsersLoadedState value, $Res Function(AuthUsersLoadedState) _then) = _$AuthUsersLoadedStateCopyWithImpl;
@useResult
$Res call({
 List<User> users
});




}
/// @nodoc
class _$AuthUsersLoadedStateCopyWithImpl<$Res>
    implements $AuthUsersLoadedStateCopyWith<$Res> {
  _$AuthUsersLoadedStateCopyWithImpl(this._self, this._then);

  final AuthUsersLoadedState _self;
  final $Res Function(AuthUsersLoadedState) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? users = null,}) {
  return _then(AuthUsersLoadedState(
null == users ? _self._users : users // ignore: cast_nullable_to_non_nullable
as List<User>,
  ));
}


}

/// @nodoc


class AuthAuthenticatedState implements AuthState {
  const AuthAuthenticatedState(this.user);
  

 final  User user;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthAuthenticatedStateCopyWith<AuthAuthenticatedState> get copyWith => _$AuthAuthenticatedStateCopyWithImpl<AuthAuthenticatedState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthAuthenticatedState&&(identical(other.user, user) || other.user == user));
}


@override
int get hashCode => Object.hash(runtimeType,user);

@override
String toString() {
  return 'AuthState.authenticated(user: $user)';
}


}

/// @nodoc
abstract mixin class $AuthAuthenticatedStateCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory $AuthAuthenticatedStateCopyWith(AuthAuthenticatedState value, $Res Function(AuthAuthenticatedState) _then) = _$AuthAuthenticatedStateCopyWithImpl;
@useResult
$Res call({
 User user
});


$UserCopyWith<$Res> get user;

}
/// @nodoc
class _$AuthAuthenticatedStateCopyWithImpl<$Res>
    implements $AuthAuthenticatedStateCopyWith<$Res> {
  _$AuthAuthenticatedStateCopyWithImpl(this._self, this._then);

  final AuthAuthenticatedState _self;
  final $Res Function(AuthAuthenticatedState) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? user = null,}) {
  return _then(AuthAuthenticatedState(
null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User,
  ));
}

/// Create a copy of AuthState
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


class AuthErrorState implements AuthState {
  const AuthErrorState(this.message);
  

 final  String message;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthErrorStateCopyWith<AuthErrorState> get copyWith => _$AuthErrorStateCopyWithImpl<AuthErrorState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthErrorState&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'AuthState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $AuthErrorStateCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory $AuthErrorStateCopyWith(AuthErrorState value, $Res Function(AuthErrorState) _then) = _$AuthErrorStateCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$AuthErrorStateCopyWithImpl<$Res>
    implements $AuthErrorStateCopyWith<$Res> {
  _$AuthErrorStateCopyWithImpl(this._self, this._then);

  final AuthErrorState _self;
  final $Res Function(AuthErrorState) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(AuthErrorState(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
