import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'data/network/api_client.dart';
import 'data/network/websocket_client.dart';
import 'data/repositories/auth_repository.dart';
import 'data/repositories/chat_repository.dart';
import 'presentation/features/auth/bloc/auth_bloc.dart';
import 'presentation/features/chat_list/bloc/chat_list_bloc.dart';
import 'presentation/router/app_router.dart';
import 'presentation/theme/app_theme.dart';
import 'core/config/app_config.dart';

void main() {
  const config = AppConfig.local;

  final apiClient = ApiClient(baseUrl: config.apiBaseUrl);
  final wsClient = WebSocketClient(baseUrl: config.wsBaseUrl);

  final authRepository = AuthRepository(apiClient);
  final chatRepository = ChatRepository(apiClient, wsClient);

  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: authRepository),
        RepositoryProvider.value(value: chatRepository),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<AuthBloc>(create: (context) => AuthBloc(authRepository)),
          BlocProvider<ChatListBloc>(
            create: (context) => ChatListBloc(chatRepository, authRepository),
          ),
        ],
        child: const IChatApp(),
      ),
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
