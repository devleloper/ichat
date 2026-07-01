import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class IMessageBubble extends StatelessWidget {
  static const double kRadius = 20.0;
  static const double kTailWidth = 9.0;
  static const double kTailHeight = 11.0;

  final String text;
  final bool isSender;
  final bool showTail;

  const IMessageBubble({
    super.key,
    required this.text,
    required this.isSender,
    this.showTail = true,
  });

  static CustomPainter tailPainter({
    required Color color,
    required bool isSender,
  }) {
    return _TailPainter(color: color, isSender: isSender);
  }

  @override
  Widget build(BuildContext context) {
    final bubbleColor = isSender
        ? AppTheme.iMessageBlue
        : AppTheme.receiverGray;
    final textColor = isSender ? AppTheme.textLight : AppTheme.textPrimary;

    return Align(
      alignment: isSender ? Alignment.centerRight : Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.only(
          left: isSender ? 72.0 : (showTail ? kTailWidth : 16.0),
          right: isSender ? (showTail ? kTailWidth : 16.0) : 72.0,
          top: 2.0,
          bottom: 2.0,
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            ClipPath(
              clipper: _SquircleClipper(
                radius: kRadius,
                isSender: isSender,
                showTail: showTail,
              ),
              child: Container(
                color: bubbleColor,
                padding: const EdgeInsets.symmetric(
                  horizontal: 14.0,
                  vertical: 10.0,
                ),
                child: Text(
                  text,
                  style: TextStyle(
                    color: textColor,
                    fontSize: 16,
                    height: 1.3,
                    letterSpacing: -0.2,
                  ),
                ),
              ),
            ),
            if (showTail)
              Positioned(
                bottom: 0,
                right: isSender ? -(kTailWidth - 1) : null,
                left: !isSender ? -(kTailWidth - 1) : null,
                child: CustomPaint(
                  painter: _TailPainter(color: bubbleColor, isSender: isSender),
                  size: const Size(kTailWidth, kTailHeight),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _SquircleClipper extends CustomClipper<Path> {
  final double radius;
  final bool isSender;
  final bool showTail;

  const _SquircleClipper({
    required this.radius,
    required this.isSender,
    required this.showTail,
  });

  @override
  Path getClip(Size size) {
    return _buildSquirclePath(
      Rect.fromLTWH(0, 0, size.width, size.height),
      bottomLeftRadius: (isSender || !showTail) ? radius : 4,
      bottomRightRadius: (!isSender || !showTail) ? radius : 4,
    );
  }

  @override
  bool shouldReclip(_SquircleClipper old) =>
      old.radius != radius ||
      old.isSender != isSender ||
      old.showTail != showTail;

  Path _buildSquirclePath(
    Rect r, {
    required double bottomLeftRadius,
    required double bottomRightRadius,
  }) {
    const c = 0.552;
    final tr = radius;
    final tl = radius;
    final br = bottomRightRadius;
    final bl = bottomLeftRadius;

    final path = Path();

    path.moveTo(r.left + tl, r.top);
    path.lineTo(r.right - tr, r.top);
    path.cubicTo(
      r.right - tr + tr * c,
      r.top,
      r.right,
      r.top + tr - tr * c,
      r.right,
      r.top + tr,
    );
    path.lineTo(r.right, r.bottom - br);
    path.cubicTo(
      r.right,
      r.bottom - br + br * c,
      r.right - br + br * c,
      r.bottom,
      r.right - br,
      r.bottom,
    );
    path.lineTo(r.left + bl, r.bottom);
    path.cubicTo(
      r.left + bl - bl * c,
      r.bottom,
      r.left,
      r.bottom - bl + bl * c,
      r.left,
      r.bottom - bl,
    );
    path.lineTo(r.left, r.top + tl);
    path.cubicTo(
      r.left,
      r.top + tl - tl * c,
      r.left + tl - tl * c,
      r.top,
      r.left + tl,
      r.top,
    );
    path.close();
    return path;
  }
}

class _TailPainter extends CustomPainter {
  final Color color;
  final bool isSender;

  const _TailPainter({required this.color, required this.isSender});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final path = Path();

    if (isSender) {
      path.moveTo(0, 0);
      path.quadraticBezierTo(
        size.width * 0.2,
        size.height * 0.6,
        size.width,
        size.height,
      );
      path.quadraticBezierTo(
        size.width * 0.4,
        size.height * 0.95,
        0,
        size.height * 0.75,
      );
      path.close();
    } else {
      path.moveTo(size.width, 0);
      path.quadraticBezierTo(
        size.width * 0.8,
        size.height * 0.6,
        0,
        size.height,
      );
      path.quadraticBezierTo(
        size.width * 0.6,
        size.height * 0.95,
        size.width,
        size.height * 0.75,
      );
      path.close();
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(_TailPainter old) =>
      old.color != color || old.isSender != isSender;
}
