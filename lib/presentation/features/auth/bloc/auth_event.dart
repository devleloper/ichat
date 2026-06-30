import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../domain/entities/user.dart';

part 'auth_event.freezed.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.loadUsers() = LoadUsersEvent;
  const factory AuthEvent.createUser(String name) = CreateUserEvent;
  const factory AuthEvent.selectUser(User user) = SelectUserEvent;
  const factory AuthEvent.logout() = LogoutEvent;
}
