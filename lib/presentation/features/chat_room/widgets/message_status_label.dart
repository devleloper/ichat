import 'package:flutter/cupertino.dart';

import '../../../../domain/entities/message/message.dart';
import '../../../theme/app_theme.dart';

class MessageStatusLabel extends StatelessWidget {
  final MessageStatus status;

  const MessageStatusLabel({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    return switch (status) {
      MessageStatus.sending => Text(
        'Sending...',
        style: TextStyle(
          color: AppTheme.secondaryLabel.withValues(alpha: 0.6),
          fontSize: 11,
          fontWeight: FontWeight.w500,
        ),
      ),
      MessageStatus.failed => const Text(
        'Failed',
        style: TextStyle(
          color: CupertinoColors.destructiveRed,
          fontSize: 11,
          fontWeight: FontWeight.w500,
        ),
      ),
      _ => const SizedBox.shrink(),
    };
  }
}
