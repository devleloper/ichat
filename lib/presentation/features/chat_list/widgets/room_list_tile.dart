import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../core/extensions/datetime_extension.dart';
import '../../../../domain/entities/room/room.dart';
import '../../../../domain/entities/user/user.dart';
import '../../../theme/app_theme.dart';
import '../../../widgets/user_tile.dart';

class RoomListTile extends StatelessWidget {
  final Room room;
  final String currentUserId;
  final Map<String, User> userCache;
  final VoidCallback onTap;

  const RoomListTile({
    super.key,
    required this.room,
    required this.currentUserId,
    required this.userCache,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final otherUserId = room.userAId == currentUserId
        ? room.userBId
        : room.userAId;
    final otherUserName = userCache[otherUserId]?.name ?? 'Неизвестный';
    final lastMsg = room.lastMessage;

    return Column(
      children: [
        UserTile(
          title: otherUserName,
          onTap: onTap,
          subtitle: lastMsg != null
              ? Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: Text(
                    lastMsg.senderId == currentUserId
                        ? 'Вы: ${lastMsg.text}'
                        : lastMsg.text,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: AppTheme.secondaryLabel,
                      fontSize: 15,
                    ),
                  ),
                )
              : const Padding(
                  padding: EdgeInsets.only(top: 4.0),
                  child: Text(
                    'Новый чат',
                    style: TextStyle(
                      color: AppTheme.secondaryLabel,
                      fontSize: 15,
                    ),
                  ),
                ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (lastMsg != null)
                Padding(
                  padding: const EdgeInsets.only(right: 4.0),
                  child: Text(
                    lastMsg.createdAt.toMessageTime(),
                    style: const TextStyle(
                      color: AppTheme.secondaryLabel,
                      fontSize: 14,
                    ),
                  ),
                ),
              const Icon(
                CupertinoIcons.chevron_right,
                color: AppTheme.separator,
                size: 20,
              ),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 84.0),
          child: Divider(height: 1, color: AppTheme.separator),
        ),
      ],
    );
  }
}
