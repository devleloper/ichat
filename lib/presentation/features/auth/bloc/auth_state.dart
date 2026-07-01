import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../domain/entities/user.dart';

part 'auth_state.freezed.dart';

@freezed
sealed class AuthState with _$AuthState {
  const factory AuthState.initial() = AuthInitialState;
  const factory AuthState.loading() = AuthLoadingState;
  const factory AuthState.usersLoaded(List<User> users) = AuthUsersLoadedState;
  const factory AuthState.authenticated(User user) = AuthAuthenticatedState;
  const factory AuthState.error(String message) = AuthErrorState;
}
