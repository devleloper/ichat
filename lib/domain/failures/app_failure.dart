sealed class AppFailure implements Exception {
  const AppFailure({required this.message});
  final String message;
}

final class NetworkFailure extends AppFailure {
  const NetworkFailure({required super.message});
}

final class ServerFailure extends AppFailure {
  const ServerFailure({required super.message, this.statusCode});
  final int? statusCode;
}

final class AuthFailure extends AppFailure {
  const AuthFailure({required super.message});
}

final class UnknownFailure extends AppFailure {
  const UnknownFailure({required super.message});
}
