import 'package:dio/dio.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/i_auth_repository.dart';
import '../models/user_dto.dart';
import '../network/api_client.dart';

class AuthRepository implements IAuthRepository {
  final ApiClient _apiClient;
  User? _currentUser;

  AuthRepository(this._apiClient);

  @override
  Future<List<User>> getUsers() async {
    try {
      final response = await _apiClient.dio.get('/api/users');
      final data = response.data['items'] as List<dynamic>;
      return data
          .map((json) => UserDto.fromJson(json as Map<String, dynamic>).toEntity())
          .toList();
    } on DioException catch (e) {
      throw Exception('Failed to get users: ${e.message}');
    }
  }

  @override
  Future<User> createUser(String name) async {
    try {
      final response = await _apiClient.dio.post(
        '/api/users',
        data: {'name': name},
      );
      
      final userDto = UserDto.fromJson(response.data as Map<String, dynamic>);
      return userDto.toEntity();
    } on DioException catch (e) {
      throw Exception('Failed to create user: ${e.message}');
    }
  }

  @override
  Future<User?> getCurrentUser() async {
    return _currentUser;
  }

  @override
  Future<void> setCurrentUser(User user) async {
    _currentUser = user;
  }

  @override
  Future<void> logout() async {
    _currentUser = null;
  }
}
