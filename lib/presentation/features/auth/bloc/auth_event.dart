import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../domain/entities/user.dart';

part 'auth_event.freezed.dart';

@freezed
sealed class AuthEvent with _$AuthEvent {
  const factory AuthEvent.checkSession() = AuthCheckSessionEvent;
  const factory AuthEvent.loadUsers() = AuthLoadUsersEvent;
  const factory AuthEvent.createUser(String name) = AuthCreateUserEvent;
  const factory AuthEvent.selectUser(User user) = AuthSelectUserEvent;
  const factory AuthEvent.logout() = AuthLogoutEvent;
}
