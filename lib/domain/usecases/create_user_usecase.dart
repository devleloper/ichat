import '../entities/user.dart';
import '../repositories/i_auth_repository.dart';

final class CreateUserUseCase {
  const CreateUserUseCase(this._repository);
  final IAuthRepository _repository;
  Future<User> call(String name) => _repository.createUser(name);
}
