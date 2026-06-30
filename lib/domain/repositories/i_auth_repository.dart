import '../entities/user.dart';

abstract class IAuthRepository {
  Future<List<User>> getUsers();
  Future<User> createUser(String name);
  Future<User?> getCurrentUser();
  Future<void> setCurrentUser(User user);
  Future<void> logout();
}
