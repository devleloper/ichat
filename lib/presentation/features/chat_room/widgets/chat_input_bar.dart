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
  final GlobalKey _textFieldKey = GlobalKey();

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

    _playFlyingTextAnimation(text);

    context.read<ChatRoomBloc>().add(ChatRoomEvent.sendMessage(text));
    _controller.clear();
  }

  void _playFlyingTextAnimation(String text) {
    final renderBox =
        _textFieldKey.currentContext?.findRenderObject() as RenderBox?;
    if (renderBox == null) return;

    final offset = renderBox.localToGlobal(Offset.zero);
    final size = renderBox.size;
    final textStyle = TextStyle(color: context.textMain, fontSize: 16);

    final overlay = Overlay.of(context);
    late OverlayEntry entry;

    entry = OverlayEntry(
      builder: (context) {
        return _FlyingText(
          text: text,
          startOffset: offset,
          size: size,
          textStyle: textStyle,
          onComplete: () {
            entry.remove();
          },
        );
      },
    );
    overlay.insert(entry);
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
                        key: _textFieldKey,
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

class _FlyingText extends StatefulWidget {
  final String text;
  final Offset startOffset;
  final Size size;
  final TextStyle textStyle;
  final VoidCallback onComplete;

  const _FlyingText({
    required this.text,
    required this.startOffset,
    required this.size,
    required this.textStyle,
    required this.onComplete,
  });

  @override
  State<_FlyingText> createState() => _FlyingTextState();
}

class _FlyingTextState extends State<_FlyingText>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _dyAnimation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _dyAnimation = Tween<double>(
      begin: 0,
      end: -40,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));
    _opacityAnimation = Tween<double>(
      begin: 1,
      end: 0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.35, curve: Curves.easeOut),
      ),
    );

    _controller.forward().then((_) => widget.onComplete());
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Positioned(
          left: widget.startOffset.dx,
          top: widget.startOffset.dy,
          width: widget.size.width,
          height: widget.size.height,
          child: ClipRect(
            child: Transform.translate(
              offset: Offset(0, _dyAnimation.value),
              child: Opacity(
                opacity: _opacityAnimation.value,
                child: Material(
                  color: Colors.transparent,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8.0,
                    ), // match contentPadding
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        widget.text,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: widget.textStyle,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
