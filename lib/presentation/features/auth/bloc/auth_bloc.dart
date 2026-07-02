// ignore_for_file: prefer_initializing_formals

import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../domain/repositories/i_auth_repository.dart';
import '../../../../domain/usecases/user/create_user_usecase.dart';
import '../../../../domain/usecases/user/get_users_usecase.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final IAuthRepository _authRepository;
  final GetUsersUseCase _getUsersUseCase;
  final CreateUserUseCase _createUserUseCase;

  AuthBloc({
    required IAuthRepository authRepository,
    required GetUsersUseCase getUsersUseCase,
    required CreateUserUseCase createUserUseCase,
  }) : _authRepository = authRepository,
       _getUsersUseCase = getUsersUseCase,
       _createUserUseCase = createUserUseCase,
       super(const AuthState.initial()) {
    on<AuthCheckSessionEvent>(_onCheckSession);
    on<AuthLoadUsersEvent>(_onLoadUsers);
    on<AuthCreateUserEvent>(_onCreateUser);
    on<AuthSelectUserEvent>(_onSelectUser);
    on<AuthLogoutEvent>(_onLogout);
  }

  void _onCheckSession(AuthCheckSessionEvent event, Emitter<AuthState> emit) {
    final user = _authRepository.currentUser;
    if (user != null) {
      emit(AuthState.authenticated(user));
    } else {
      add(const AuthEvent.loadUsers());
    }
  }

  Future<void> _onLoadUsers(
    AuthLoadUsersEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthState.loading());
    try {
      final users = await _getUsersUseCase();
      emit(AuthState.usersLoaded(users));
    } catch (e) {
      emit(AuthState.error(e.toString()));
    }
  }

  Future<void> _onCreateUser(
    AuthCreateUserEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthState.loading());
    try {
      final user = await _createUserUseCase(event.name);
      await _authRepository.setCurrentUser(user);
      emit(AuthState.authenticated(user));
    } catch (e) {
      emit(AuthState.error(e.toString()));
      add(const AuthEvent.loadUsers());
    }
  }

  Future<void> _onSelectUser(
    AuthSelectUserEvent event,
    Emitter<AuthState> emit,
  ) async {
    await _authRepository.setCurrentUser(event.user);
    emit(AuthState.authenticated(event.user));
  }

  Future<void> _onLogout(AuthLogoutEvent event, Emitter<AuthState> emit) async {
    await _authRepository.logout();
    emit(const AuthState.initial());
    add(const AuthEvent.loadUsers());
  }
}
