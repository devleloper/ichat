import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../theme/app_theme.dart';
import '../../../widgets/bounce_button.dart';
import '../../../widgets/custom_text_field.dart';
import '../bloc/chat_list_bloc.dart';
import '../bloc/chat_list_event.dart';
import '../bloc/chat_list_state.dart';
import '../../auth/bloc/auth_bloc.dart';
import '../../../../domain/entities/user.dart';
import '../../auth/bloc/auth_state.dart';

class ChatListScreen extends StatefulWidget {
  const ChatListScreen({super.key});

  @override
  State<ChatListScreen> createState() => _ChatListScreenState();
}

class _ChatListScreenState extends State<ChatListScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<ChatListBloc>().add(const ChatListEvent.loadRooms());
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _showNewMessageSheet(BuildContext context, Map<String, User> userCache) {
    final authState = context.read<AuthBloc>().state;
    final currentUserId = switch (authState) {
      AuthenticatedState s => s.user.id,
      _ => null,
    };

    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (sheetContext) {
        return SafeArea(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'New Message',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: userCache.length,
                  itemBuilder: (context, index) {
                    final user = userCache.values.elementAt(index);
                    if (user.id == currentUserId)
                      return const SizedBox.shrink();

                    return ListTile(
                      leading: CircleAvatar(
                        backgroundColor: AppTheme.iMessageBlue,
                        child: Text(
                          user.name[0].toUpperCase(),
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                      title: Text(user.name),
                      onTap: () {
                        Navigator.pop(sheetContext);
                        context.read<ChatListBloc>().add(
                          ChatListEvent.createRoom(user.id),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              floating: true,
              pinned: true,
              expandedHeight: 120.0,
              backgroundColor: AppTheme.backgroundLight,
              actions: [
                BounceButton(
                  onPressed: () {
                    final state = context.read<ChatListBloc>().state;
                    if (state is LoadedState) {
                      _showNewMessageSheet(context, state.userCache);
                    }
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Icon(
                      CupertinoIcons.pencil_outline,
                      color: AppTheme.iMessageBlue,
                      size: 28,
                    ),
                  ),
                ),
              ],
              flexibleSpace: FlexibleSpaceBar(
                titlePadding: const EdgeInsets.only(left: 16, bottom: 12),
                title: const Text(
                  'Messages',
                  style: TextStyle(
                    color: AppTheme.textDark,
                    fontWeight: FontWeight.w700,
                    letterSpacing: -0.5,
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 8.0,
                ),
                child: CustomTextField(
                  controller: _searchController,
                  hintText: 'Search',
                  prefixIcon: const Padding(
                    padding: EdgeInsets.only(left: 12.0, bottom: 8.0),
                    child: Icon(
                      CupertinoIcons.search,
                      color: Color(0xFF8E8E93),
                      size: 20,
                    ),
                  ),
                ),
              ),
            ),
            BlocBuilder<ChatListBloc, ChatListState>(
              builder: (context, state) {
                if (state is ChatListLoadingState) {
                  return const SliverFillRemaining(
                    child: Center(child: CupertinoActivityIndicator()),
                  );
                } else if (state is ChatListErrorState) {
                  return SliverFillRemaining(
                    child: Center(
                      child: Text(
                        state.message,
                        style: const TextStyle(
                          color: CupertinoColors.destructiveRed,
                        ),
                      ),
                    ),
                  );
                } else if (state is LoadedState) {
                  if (state.rooms.isEmpty) {
                    return const SliverFillRemaining(
                      child: Center(
                        child: Text(
                          'No messages yet',
                          style: TextStyle(color: Color(0xFF8E8E93)),
                        ),
                      ),
                    );
                  }

                  final authState = context.read<AuthBloc>().state;
                  final currentUserId = switch (authState) {
                    AuthenticatedState a => a.user.id,
                    _ => null,
                  };

                  return SliverList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                      final room = state.rooms[index];
                      final otherUserId = room.userAId == currentUserId
                          ? room.userBId
                          : room.userAId;
                      final otherUser = state.userCache[otherUserId];
                      final otherUserName = otherUser?.name ?? 'Unknown';

                      return BounceButton(
                        onPressed: () {
                          context.push('/chats/${room.id}');
                        },
                        child: Column(
                          children: [
                            ListTile(
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 16.0,
                                vertical: 4.0,
                              ),
                              leading: CircleAvatar(
                                radius: 26,
                                backgroundColor: const Color(0xFFE5E5EA),
                                child: Text(
                                  otherUserName[0].toUpperCase(),
                                  style: const TextStyle(
                                    color: AppTheme.textDark,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              title: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    otherUserName,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                    ),
                                  ),
                                  if (room.lastMessage != null)
                                    Text(
                                      _formatTime(room.lastMessage!.createdAt),
                                      style: const TextStyle(
                                        color: Color(0xFF8E8E93),
                                        fontSize: 14,
                                      ),
                                    ),
                                ],
                              ),
                              subtitle: Padding(
                                padding: const EdgeInsets.only(top: 4.0),
                                child: Text(
                                  room.lastMessage?.text ?? 'New Chat',
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    color: Color(0xFF8E8E93),
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                              trailing: const Icon(
                                CupertinoIcons.chevron_right,
                                color: Color(0xFFC7C7CC),
                                size: 20,
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 84.0),
                              child: Divider(
                                height: 1,
                                color: Color(0xFFE5E5EA),
                              ),
                            ),
                          ],
                        ),
                      );
                    }, childCount: state.rooms.length),
                  );
                }

                return const SliverFillRemaining(child: SizedBox.shrink());
              },
            ),
          ],
        ),
      ),
    );
  }

  String _formatTime(DateTime date) {
    final now = DateTime.now();
    if (date.year == now.year &&
        date.month == now.month &&
        date.day == now.day) {
      return '${date.hour}:${date.minute.toString().padLeft(2, '0')}';
    }
    return '${date.month}/${date.day}/${date.year.toString().substring(2)}';
  }
}
