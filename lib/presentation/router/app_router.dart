import 'package:go_router/go_router.dart';
import '../features/auth/view/auth_screen.dart';
import '../features/chat_list/view/chat_list_screen.dart';

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
  ],
);
