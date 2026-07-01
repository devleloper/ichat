import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../theme/app_theme.dart';
import '../../../widgets/bounce_button.dart';
import '../bloc/chat_room_bloc.dart';
import '../bloc/chat_room_event.dart';
import '../bloc/chat_room_state.dart';

class ChatInputBar extends StatefulWidget {
  const ChatInputBar({super.key});

  @override
  State<ChatInputBar> createState() => _ChatInputBarState();
}

class _ChatInputBarState extends State<ChatInputBar> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    _controller.removeListener(_onTextChanged);
    _controller.dispose();
    super.dispose();
  }

  void _onTextChanged() {
    if (_controller.text.trim().isNotEmpty) {
      context.read<ChatRoomBloc>().add(const ChatRoomEvent.sendTyping());
    }
  }

  void _sendMessage() {
    final text = _controller.text.trim();
    if (text.isEmpty) return;
    context.read<ChatRoomBloc>().add(ChatRoomEvent.sendMessage(text));
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatRoomBloc, ChatRoomState>(
      buildWhen: (_, _) => false,
      builder: (context, _) => _buildBar(),
    );
  }

  Widget _buildBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      color: context.bgPrimary,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: context.inputBorderColor),
                borderRadius: BorderRadius.circular(24),
                color: context.bgSecondary,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12.0, right: 8.0),
                      child: TextField(
                        controller: _controller,
                        maxLines: 1,
                        textInputAction: TextInputAction.send,
                        style: TextStyle(color: context.textMain),
                        onSubmitted: (_) => _sendMessage(),
                        decoration: InputDecoration(
                          hintText: AppStrings.messagePlaceholder,
                          hintStyle: TextStyle(color: context.textSecondary),
                          border: InputBorder.none,
                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(vertical: 8.0),
                        ),
                      ),
                    ),
                  ),
                  ValueListenableBuilder<TextEditingValue>(
                    valueListenable: _controller,
                    builder: (context, value, _) {
                      final hasText = value.text.trim().isNotEmpty;
                      return Padding(
                        padding: const EdgeInsets.only(
                          left: 4.0,
                          right: 8.0,
                          top: 4.0,
                          bottom: 4.0,
                        ),
                        child: BounceButton(
                          onPressed: hasText ? _sendMessage : () {},
                          child: CircleAvatar(
                            radius: 14,
                            backgroundColor: hasText
                                ? AppTheme.iMessageBlue
                                : Colors.transparent,
                            child: Icon(
                              CupertinoIcons.arrow_up,
                              color: hasText
                                  ? Colors.white
                                  : context.inputBorderColor,
                              size: 18,
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
