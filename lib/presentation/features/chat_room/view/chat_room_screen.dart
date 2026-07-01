import 'dart:ui' as dart_ui;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/di/service_locator.dart';
import '../../../theme/app_theme.dart';
import '../../../widgets/bounce_button.dart';
import '../bloc/chat_room_bloc.dart';
import '../bloc/chat_room_event.dart';
import '../widgets/chat_input_bar.dart';
import '../widgets/message_list.dart';

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
        chatRepository: getIt(),
        authRepository: getIt(),
        getMessagesUseCase: getIt(),
        sendMessageUseCase: getIt(),
        connectToRoomUseCase: getIt(),
        roomId: roomId,
      )..add(const ChatRoomEvent.loadMessages()),
      child: _ChatRoomView(otherUserName: otherUserName),
    );
  }
}

class _ChatRoomView extends StatelessWidget {
  final String otherUserName;

  const _ChatRoomView({required this.otherUserName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: context.bgPrimary,
      appBar: _buildAppBar(context),
      body: Column(
        children: const [
          Expanded(child: MessageList()),
          SafeArea(top: false, child: ChatInputBar()),
        ],
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      flexibleSpace: ClipRect(
        child: BackdropFilter(
          filter: dart_ui.ImageFilter.blur(sigmaX: 15, sigmaY: 15),
          child: Container(
            decoration: BoxDecoration(
              color: context.bgPrimary.withValues(alpha: 0.7),
              border: Border(
                bottom: BorderSide(color: context.separatorColor, width: 0.5),
              ),
            ),
          ),
        ),
      ),
      elevation: 0,
      leading: BounceButton(
        onPressed: () => context.pop(),
        child: const Row(
          children: [
            Icon(CupertinoIcons.chevron_back, color: AppTheme.iMessageBlue),
            Text(
              AppStrings.back,
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
            backgroundColor: context.receiverBubble,
            child: Text(
              otherUserName.isNotEmpty ? otherUserName[0].toUpperCase() : '?',
              style: TextStyle(
                color: context.textMain,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            otherUserName,
            style: TextStyle(
              color: context.textMain,
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
      centerTitle: true,
      toolbarHeight: 70,
    );
  }
}
