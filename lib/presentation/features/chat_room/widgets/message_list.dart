import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/entities/message.dart';
import '../../../theme/app_theme.dart';
import '../../../widgets/imessage_bubble.dart';
import '../bloc/chat_room_bloc.dart';
import '../bloc/chat_room_state.dart';
import 'message_status_label.dart';
import 'typing_indicator_bubble.dart';

class MessageList extends StatelessWidget {
  const MessageList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatRoomBloc, ChatRoomState>(
      builder: (context, state) => switch (state) {
        ChatRoomLoadingState() => const Center(
          child: CupertinoActivityIndicator(),
        ),
        ChatRoomErrorState(message: final msg) => Center(
          child: Text(
            msg,
            style: const TextStyle(color: AppTheme.destructiveRed),
          ),
        ),
        ChatRoomLoadedState() => _LoadedMessageList(state: state),
        _ => const SizedBox.shrink(),
      },
    );
  }
}

class _LoadedMessageList extends StatelessWidget {
  final ChatRoomLoadedState state;

  const _LoadedMessageList({required this.state});

  @override
  Widget build(BuildContext context) {
    final itemCount = state.messages.length + (state.isOtherUserTyping ? 1 : 0);

    final topPadding = 70 + MediaQuery.paddingOf(context).top + 8.0;

    return ListView.builder(
      reverse: true,
      padding: EdgeInsets.only(top: topPadding, bottom: 8.0),
      itemCount: itemCount,
      itemBuilder: (context, index) {
        if (state.isOtherUserTyping && index == 0) {
          return const TypingIndicatorBubble();
        }

        final msgIndex = state.isOtherUserTyping ? index - 1 : index;
        final msg = state.messages[msgIndex];
        final isSender = msg.senderId == state.currentUserId;
        final isLastInGroup =
            msgIndex == 0 ||
            state.messages[msgIndex - 1].senderId != msg.senderId;

        return Column(
          crossAxisAlignment: isSender
              ? CrossAxisAlignment.end
              : CrossAxisAlignment.start,
          children: [
            IMessageBubble(
              text: msg.text,
              isSender: isSender,
              showTail: isLastInGroup,
            ),
            if (isSender && msg.status != MessageStatus.sent && index == 0)
              Padding(
                padding: const EdgeInsets.only(right: 22.0, top: 2.0),
                child: MessageStatusLabel(status: msg.status),
              ),
            SizedBox(height: isLastInGroup ? 12 : 2),
          ],
        );
      },
    );
  }
}
