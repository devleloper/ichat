import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../domain/repositories/i_auth_repository.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final IAuthRepository _authRepository;

  AuthBloc(this._authRepository) : super(const AuthState.initial()) {
    on<LoadUsersEvent>(_onLoadUsers);
    on<CreateUserEvent>(_onCreateUser);
    on<SelectUserEvent>(_onSelectUser);
    on<LogoutEvent>(_onLogout);
  }

  Future<void> _onLoadUsers(LoadUsersEvent event, Emitter<AuthState> emit) async {
    emit(const AuthState.loading());
    try {
      final users = await _authRepository.getUsers();
      emit(AuthState.usersLoaded(users));
    } catch (e) {
      emit(AuthState.error(e.toString()));
    }
  }

  Future<void> _onCreateUser(CreateUserEvent event, Emitter<AuthState> emit) async {
    emit(const AuthState.loading());
    try {
      final user = await _authRepository.createUser(event.name);
      await _authRepository.setCurrentUser(user);
      emit(AuthState.authenticated(user));
    } catch (e) {
      emit(AuthState.error(e.toString()));
      add(const AuthEvent.loadUsers());
    }
  }

  Future<void> _onSelectUser(SelectUserEvent event, Emitter<AuthState> emit) async {
    await _authRepository.setCurrentUser(event.user);
    emit(AuthState.authenticated(event.user));
  }

  Future<void> _onLogout(LogoutEvent event, Emitter<AuthState> emit) async {
    await _authRepository.logout();
    add(const AuthEvent.loadUsers());
  }
}
