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
        child: CustomPaint(
          painter: showTail ? _IMessageTailPainter(isSender: isSender) : null,
          child: Container(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.75,
            ),
            margin: EdgeInsets.only(
              bottom: showTail ? 4.0 : 0.0,
              left: isSender ? 0 : (showTail ? 4.0 : 0.0),
              right: isSender ? (showTail ? 4.0 : 0.0) : 0,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
            decoration: BoxDecoration(
              color: isSender ? AppTheme.iMessageBlue : AppTheme.receiverGray,
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(20),
                topRight: const Radius.circular(20),
                bottomLeft: Radius.circular(isSender || !showTail ? 20 : 4),
                bottomRight: Radius.circular(!isSender || !showTail ? 20 : 4),
              ),
            ),
            child: Text(
              text,
              style: AppTheme.lightTheme.textTheme.bodyMedium?.copyWith(
                color: isSender ? AppTheme.textLight : AppTheme.textDark,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _IMessageTailPainter extends CustomPainter {
  final bool isSender;

  _IMessageTailPainter({required this.isSender});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = isSender ? AppTheme.iMessageBlue : AppTheme.receiverGray
      ..style = PaintingStyle.fill;

    final path = Path();

    if (isSender) {
      path.moveTo(size.width - 4, size.height - 16);
      path.quadraticBezierTo(
        size.width,
        size.height,
        size.width + 8,
        size.height,
      );
      path.quadraticBezierTo(
        size.width + 2,
        size.height,
        size.width - 4,
        size.height - 10,
      );
    } else {
      path.moveTo(4, size.height - 16);
      path.quadraticBezierTo(
        0,
        size.height,
        -8,
        size.height,
      );
      path.quadraticBezierTo(
        -2,
        size.height,
        4,
        size.height - 10,
      );
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant _IMessageTailPainter oldDelegate) {
    return oldDelegate.isSender != isSender;
  }
}
