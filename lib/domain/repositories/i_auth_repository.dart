import '../entities/user.dart';

abstract class IAuthRepository {
  User? get currentUser;
  Future<List<User>> getUsers();
  Future<User> createUser(String name);
  Future<void> setCurrentUser(User user);
  Future<void> logout();
}
