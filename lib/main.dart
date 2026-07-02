import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/di/service_locator.dart';
import 'presentation/features/auth/bloc/auth_bloc.dart';
import 'presentation/features/auth/bloc/auth_event.dart';
import 'presentation/features/chat_list/bloc/chat_list_bloc.dart';
import 'presentation/router/app_router.dart';
import 'presentation/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await setupServiceLocator();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (context) => AuthBloc(
            authRepository: getIt(),
            getUsersUseCase: getIt(),
            createUserUseCase: getIt(),
          )..add(const AuthEvent.checkSession()),
        ),
        BlocProvider<ChatListBloc>(
          create: (context) => ChatListBloc(
            chatRepository: getIt(),
            authRepository: getIt(),
            getRoomsUseCase: getIt(),
            getUsersUseCase: getIt(),
          ),
        ),
      ],
      child: const IChatApp(),
    ),
  );
}

class IChatApp extends StatelessWidget {
  const IChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'iChat',
      theme: AppTheme.lightTheme,
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
    );
  }
}
