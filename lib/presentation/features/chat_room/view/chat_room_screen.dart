import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../data/repositories/auth_repository.dart';
import '../../../../data/repositories/chat_repository.dart';
import '../../../../domain/entities/message.dart';
import '../../../theme/app_theme.dart';
import '../../../widgets/bounce_button.dart';
import '../../../widgets/imessage_bubble.dart';
import '../../auth/bloc/auth_bloc.dart';
import '../../auth/bloc/auth_state.dart';
import '../bloc/chat_room_bloc.dart';
import '../bloc/chat_room_event.dart';
import '../bloc/chat_room_state.dart';

class ChatRoomScreen extends StatelessWidget {
  final String roomId;
  final String otherUserName;

  const ChatRoomScreen({
    super.key, 
    required this.roomId,
    required this.otherUserName,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChatRoomBloc(
        chatRepository: context.read<ChatRepository>(),
        authRepository: context.read<AuthRepository>(),
        roomId: roomId,
      )..add(const ChatRoomEvent.loadMessages()),
      child: _ChatRoomView(
        roomId: roomId,
        otherUserName: otherUserName,
      ),
    );
  }
}

class _ChatRoomView extends StatefulWidget {
  final String roomId;
  final String otherUserName;
  
  const _ChatRoomView({
    required this.roomId,
    required this.otherUserName,
  });

  @override
  State<_ChatRoomView> createState() => _ChatRoomViewState();
}

class _ChatRoomViewState extends State<_ChatRoomView> {
  final TextEditingController _textController = TextEditingController();

  void _onTextChanged() {
    final text = _textController.text.trim();
    if (text.isNotEmpty) {
      context.read<ChatRoomBloc>().add(const ChatRoomEvent.sendTyping());
    }
  }

  @override
  void initState() {
    super.initState();
    _textController.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    _textController.removeListener(_onTextChanged);
    _textController.dispose();
    super.dispose();
  }

  void _sendMessage() {
    final text = _textController.text.trim();
    if (text.isEmpty) return;

    context.read<ChatRoomBloc>().add(ChatRoomEvent.sendMessage(text));
    _textController.clear();
  }

  @override
  Widget build(BuildContext context) {
    final currentUserId = switch (context.read<AuthBloc>().state) {
      AuthenticatedState s => s.user.id,
      _ => null,
    };

    return Scaffold(
      backgroundColor: AppTheme.backgroundLight,
      appBar: AppBar(
        backgroundColor: AppTheme.backgroundLight.withValues(alpha: 0.95),
        elevation: 0,
        leading: BounceButton(
          onPressed: () => context.pop(),
          child: const Row(
            children: [
              Icon(CupertinoIcons.chevron_back, color: AppTheme.iMessageBlue),
              Text(
                'Назад',
                style: TextStyle(color: AppTheme.iMessageBlue, fontSize: 16),
              ),
            ],
          ),
        ),
        leadingWidth: 80,
        title: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              radius: 18,
              backgroundColor: AppTheme.receiverGray,
              child: Text(
                widget.otherUserName.isNotEmpty 
                    ? widget.otherUserName[0].toUpperCase() 
                    : '?',
                style: const TextStyle(
                  color: AppTheme.textDark,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 6),
            Text(
              widget.otherUserName,
              style: const TextStyle(
                color: AppTheme.textDark,
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        centerTitle: true,
        toolbarHeight: 70,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: BlocBuilder<ChatRoomBloc, ChatRoomState>(
                builder: (context, state) {
                  if (state is ChatRoomLoadingState) {
                    return const Center(child: CupertinoActivityIndicator());
                  } else if (state is ChatRoomErrorState) {
                    return Center(
                      child: Text(
                        state.message,
                        style: const TextStyle(color: CupertinoColors.destructiveRed),
                      ),
                    );
                  } else if (state is ChatRoomLoadedState) {
                    return ListView.builder(
                      reverse: true,
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      itemCount: state.messages.length + (state.isOtherUserTyping ? 1 : 0),
                      itemBuilder: (context, index) {
                        if (state.isOtherUserTyping && index == 0) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: IMessageBubble(
                              text: '...',
                              isSender: false,
                              showTail: true,
                            ),
                          );
                        }

                        final msgIndex = state.isOtherUserTyping ? index - 1 : index;
                        final msg = state.messages[msgIndex];
                        final isSender = msg.senderId == currentUserId;
                        bool isLastMessageInGroup = true;
                        if (msgIndex > 0) {
                          isLastMessageInGroup = state.messages[msgIndex - 1].senderId != msg.senderId;
                        }

                        return Column(
                          crossAxisAlignment: isSender
                              ? CrossAxisAlignment.end
                              : CrossAxisAlignment.start,
                          children: [
                            IMessageBubble(
                              text: msg.text,
                              isSender: isSender,
                              showTail: isLastMessageInGroup,
                            ),
                            if (isSender && msg.status != MessageStatus.sent && index == 0)
                              Padding(
                                padding: const EdgeInsets.only(right: 22.0, top: 2.0),
                                child: Text(
                                  msg.status == MessageStatus.sending
                                      ? 'Отправка...'
                                      : 'Ошибка',
                                  style: TextStyle(
                                    color: msg.status == MessageStatus.failed
                                        ? CupertinoColors.destructiveRed
                                        : AppTheme.textLight.withValues(alpha: 0.5),
                                    fontSize: 11,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            if (isLastMessageInGroup) const SizedBox(height: 12) else const SizedBox(height: 2),
                          ],
                        );
                      },
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
            ),
            _buildInputArea(),
          ],
        ),
      ),
    );
  }

  Widget _buildInputArea() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      color: AppTheme.backgroundLight,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: Container(
              constraints: const BoxConstraints(minHeight: 36, maxHeight: 120),
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFFC6C6C8)),
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: TextField(
                        controller: _textController,
                        maxLines: null,
                        textInputAction: TextInputAction.send,
                        onSubmitted: (_) => _sendMessage(),
                        decoration: const InputDecoration(
                          hintText: 'Сообщение',
                          hintStyle: TextStyle(color: Color(0xFFC7C7CC)),
                          border: InputBorder.none,
                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(vertical: 8.0),
                        ),
                      ),
                    ),
                  ),
                  ValueListenableBuilder<TextEditingValue>(
                    valueListenable: _textController,
                    builder: (context, value, child) {
                      final hasText = value.text.trim().isNotEmpty;
                      return BounceButton(
                        onPressed: hasText ? _sendMessage : () {},
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: CircleAvatar(
                            radius: 14,
                            backgroundColor: hasText ? AppTheme.iMessageBlue : Colors.transparent,
                            child: Icon(
                              CupertinoIcons.arrow_up,
                              color: hasText ? Colors.white : const Color(0xFFC7C7CC),
                              size: 20,
                              weight: 700,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
