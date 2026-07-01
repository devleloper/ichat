import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class IMessageBubble extends StatelessWidget {
  final String text;
  final bool isSender;
  final bool showTail;

  const IMessageBubble({
    super.key,
    required this.text,
    required this.isSender,
    this.showTail = true,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isSender ? Alignment.centerRight : Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 2.0),
        child: Container(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.75,
          ),
          margin: EdgeInsets.only(
            bottom: showTail ? 4.0 : 0.0,
            left: isSender ? 0 : (showTail ? 4.0 : 0.0),
            right: isSender ? (showTail ? 4.0 : 0.0) : 0,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          decoration: BoxDecoration(
            color: isSender ? AppTheme.iMessageBlue : AppTheme.receiverGray,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            text,
            style: AppTheme.lightTheme.textTheme.bodyMedium?.copyWith(
              color: isSender ? AppTheme.textLight : AppTheme.textDark,
              fontSize: 17,
              height: 1.2,
            ),
          ),
        ),
      ),
    );
  }
}
