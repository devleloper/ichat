import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../features/auth/view/auth_screen.dart';
import '../features/chat_list/bloc/chat_list_bloc.dart';
import '../features/chat_list/bloc/chat_list_state.dart';
import '../features/chat_list/view/chat_list_screen.dart';
import '../features/chat_room/view/chat_room_screen.dart';
import '../../core/di/service_locator.dart';
import '../../domain/repositories/i_auth_repository.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: getIt<IAuthRepository>().currentUser != null
      ? '/chats'
      : '/',
  routes: [
    GoRoute(path: '/', builder: (context, state) => const AuthScreen()),
    GoRoute(
      path: '/chats',
      builder: (context, state) => const ChatListScreen(),
    ),
    GoRoute(
      path: '/chats/:id',
      builder: (context, state) {
        final roomId = state.pathParameters['id']!;
        final otherUserId = state.uri.queryParameters['userId'];

        String otherUserName = 'Chat';
        if (otherUserId != null) {
          final chatListState = context.read<ChatListBloc>().state;
          if (chatListState is ChatListLoadedState) {
            otherUserName =
                chatListState.userCache[otherUserId]?.name ?? 'Chat';
          }
        }

        return ChatRoomScreen(roomId: roomId, otherUserName: otherUserName);
      },
    ),
  ],
);
