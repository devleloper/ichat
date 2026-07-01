import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../theme/app_theme.dart';
import '../../../widgets/bounce_button.dart';
import '../bloc/chat_list_bloc.dart';
import '../bloc/chat_list_event.dart';
import '../bloc/chat_list_state.dart';
import '../widgets/new_message_sheet.dart';
import '../widgets/room_list_tile.dart';
import '../../auth/bloc/auth_bloc.dart';
import '../../auth/bloc/auth_event.dart';
import '../../auth/bloc/auth_state.dart';

class ChatListScreen extends StatefulWidget {
  const ChatListScreen({super.key});

  @override
  State<ChatListScreen> createState() => _ChatListScreenState();
}

class _ChatListScreenState extends State<ChatListScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ChatListBloc>().add(const ChatListEvent.loadRooms());
  }

  void _showNewMessageSheet(
    BuildContext context,
    ChatListLoadedState loadedState,
  ) {
    final otherUsers = loadedState.userCache.values
        .where((u) => u.id != loadedState.currentUserId)
        .toList();

    showModalBottomSheet<void>(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) => NewMessageSheet(otherUsers: otherUsers),
    );
  }

  void _showProfileSheet(BuildContext context, String userName) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => CupertinoActionSheet(
        title: Text('Аккаунт: $userName'),
        actions: <CupertinoActionSheetAction>[
          CupertinoActionSheetAction(
            isDestructiveAction: true,
            onPressed: () {
              Navigator.pop(context);
              context.read<AuthBloc>().add(const AuthEvent.logout());
            },
            child: const Text('Выйти'),
          ),
        ],
        cancelButton: CupertinoActionSheetAction(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Отмена'),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthInitialState) {
          context.go('/');
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              BlocBuilder<ChatListBloc, ChatListState>(
                builder: (context, state) {
                  String userName = '';
                  if (state is ChatListLoadedState) {
                    userName = state.userCache[state.currentUserId]?.name ?? '';
                  }

                  return SliverAppBar(
                    floating: true,
                    pinned: true,
                    expandedHeight: 70.0,
                    backgroundColor: context.bgPrimary,
                    flexibleSpace: FlexibleSpaceBar(
                      titlePadding: const EdgeInsets.only(left: 16, bottom: 12),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                AppStrings.messages,
                                style: TextStyle(
                                  color: context.textMain,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: -0.5,
                                ),
                              ),
                              const SizedBox(width: 8),
                              BounceButton(
                                onPressed: () {
                                  _showProfileSheet(context, userName);
                                },
                                child: const Padding(
                                  padding: EdgeInsets.only(top: 2.0),
                                  child: Icon(
                                    CupertinoIcons.person_crop_circle,
                                    color: AppTheme.iMessageBlue,
                                    size: 22,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          BounceButton(
                            onPressed: () {
                              if (state is ChatListLoadedState) {
                                _showNewMessageSheet(context, state);
                              }
                            },
                            child: const Padding(
                              padding: EdgeInsets.only(right: 16.0, top: 2.0),
                              child: Icon(
                                CupertinoIcons.square_pencil,
                                color: AppTheme.iMessageBlue,
                                size: 22,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              BlocBuilder<ChatListBloc, ChatListState>(
                builder: (context, state) => switch (state) {
                  ChatListLoadingState() => const SliverFillRemaining(
                    child: Center(child: CupertinoActivityIndicator()),
                  ),
                  ChatListErrorState(message: final msg) => SliverFillRemaining(
                    child: Center(
                      child: Text(
                        msg,
                        style: const TextStyle(color: AppTheme.destructiveRed),
                      ),
                    ),
                  ),
                  ChatListLoadedState() => _RoomList(state: state),
                  _ => const SliverFillRemaining(child: SizedBox.shrink()),
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _RoomList extends StatelessWidget {
  final ChatListLoadedState state;

  const _RoomList({required this.state});

  @override
  Widget build(BuildContext context) {
    if (state.rooms.isEmpty) {
      return SliverFillRemaining(
        child: Center(
          child: Text(
            AppStrings.noMessagesYet,
            style: TextStyle(color: context.textSecondary),
          ),
        ),
      );
    }

    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => RoomListTile(
          room: state.rooms[index],
          currentUserId: state.currentUserId,
          userCache: state.userCache,
          onTap: () {
            final room = state.rooms[index];
            final otherUserId = room.userAId == state.currentUserId
                ? room.userBId
                : room.userAId;
            context.push('/chats/${room.id}?userId=$otherUserId');
          },
        ),
        childCount: state.rooms.length,
      ),
    );
  }
}
