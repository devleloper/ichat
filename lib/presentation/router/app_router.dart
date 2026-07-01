import 'package:go_router/go_router.dart';
import '../features/auth/view/auth_screen.dart';
import '../features/chat_list/view/chat_list_screen.dart';
import '../features/chat_room/view/chat_room_screen.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const AuthScreen(),
    ),
    GoRoute(
      path: '/chats',
      builder: (context, state) => const ChatListScreen(),
    ),
    GoRoute(
      path: '/chats/:id',
      builder: (context, state) {
        final roomId = state.pathParameters['id']!;
        final otherUserName = state.extra as String? ?? 'Chat';
        return ChatRoomScreen(roomId: roomId, otherUserName: otherUserName);
      },
    ),
  ],
);
