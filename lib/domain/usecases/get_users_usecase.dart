import '../entities/user.dart';
import '../repositories/i_auth_repository.dart';

final class GetUsersUseCase {
  const GetUsersUseCase(this._repository);
  final IAuthRepository _repository;
  Future<List<User>> call() => _repository.getUsers();
}
