import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../domain/entities/user.dart';
import '../../domain/failures/app_failure.dart';
import '../../domain/repositories/i_auth_repository.dart';
import '../models/user_dto.dart';
import '../network/api_client.dart';

class AuthRepository implements IAuthRepository {
  final ApiClient _apiClient;
  static const String _currentUserIdKey = 'current_user_id';
  static const String _currentUserNameKey = 'current_user_name';
  static const String _currentUserCreatedAtKey = 'current_user_created_at';

  User? _currentUser;

  AuthRepository(this._apiClient);

  Future<void> init() async {
    final prefs = await SharedPreferences.getInstance();
    final id = prefs.getString(_currentUserIdKey);
    final name = prefs.getString(_currentUserNameKey);
    final createdAtStr = prefs.getString(_currentUserCreatedAtKey);
    if (id != null && name != null && createdAtStr != null) {
      _currentUser = User(
        id: id,
        name: name,
        createdAt: DateTime.parse(createdAtStr),
      );
    }
  }

  @override
  User? get currentUser => _currentUser;

  @override
  Future<List<User>> getUsers() async {
    try {
      final response = await _apiClient.dio.get('/api/users');
      final data = response.data['items'] as List<dynamic>?;
      if (data == null) return [];
      return data
          .map(
            (json) => UserDto.fromJson(json as Map<String, dynamic>).toEntity(),
          )
          .toList();
    } on DioException catch (e) {
      throw NetworkFailure(message: e.message ?? 'Network error');
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
      throw NetworkFailure(message: e.message ?? 'Network error');
    }
  }

  @override
  Future<void> setCurrentUser(User user) async {
    _currentUser = user;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_currentUserIdKey, user.id);
    await prefs.setString(_currentUserNameKey, user.name);
    await prefs.setString(
      _currentUserCreatedAtKey,
      user.createdAt.toIso8601String(),
    );
  }

  @override
  Future<void> logout() async {
    _currentUser = null;
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_currentUserIdKey);
    await prefs.remove(_currentUserNameKey);
    await prefs.remove(_currentUserCreatedAtKey);
  }
}
