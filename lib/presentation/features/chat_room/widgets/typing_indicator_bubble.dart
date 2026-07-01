import 'package:flutter/material.dart';
import '../../../theme/app_theme.dart';
import '../../../widgets/imessage_bubble.dart';

class TypingIndicatorBubble extends StatefulWidget {
  const TypingIndicatorBubble({super.key});

  @override
  State<TypingIndicatorBubble> createState() => _TypingIndicatorBubbleState();
}

class _TypingIndicatorBubbleState extends State<TypingIndicatorBubble>
    with TickerProviderStateMixin {
  late final List<AnimationController> _dotControllers;
  late final List<Animation<double>> _dotScales;

  static const int _dotCount = 3;
  static const Duration _dotPeriod = Duration(milliseconds: 600);
  static const Duration _dotStagger = Duration(milliseconds: 150);

  @override
  void initState() {
    super.initState();
    _dotControllers = List.generate(
      _dotCount,
      (_) => AnimationController(vsync: this, duration: _dotPeriod),
    );
    _dotScales = _dotControllers.map((c) {
      return Tween<double>(
        begin: 0.6,
        end: 1.0,
      ).animate(CurvedAnimation(parent: c, curve: Curves.easeInOut));
    }).toList();

    for (var i = 0; i < _dotCount; i++) {
      Future.delayed(_dotStagger * i, () {
        if (mounted) _dotControllers[i].repeat(reverse: true);
      });
    }
  }

  @override
  void dispose() {
    for (final c in _dotControllers) {
      c.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
        child: _BubbleContainer(
          color: AppTheme.receiverGray,
          showTail: true,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 14.0,
              vertical: 12.0,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(_dotCount, (i) {
                return Padding(
                  padding: EdgeInsets.only(right: i < _dotCount - 1 ? 4.0 : 0),
                  child: ScaleTransition(
                    scale: _dotScales[i],
                    child: Container(
                      width: 8,
                      height: 8,
                      decoration: const BoxDecoration(
                        color: AppTheme.secondaryLabel,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}

class _BubbleContainer extends StatelessWidget {
  final Color color;
  final bool showTail;
  final Widget child;

  const _BubbleContainer({
    required this.color,
    required this.showTail,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          margin: EdgeInsets.only(left: showTail ? 8 : 0),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(IMessageBubble.kRadius),
              topRight: const Radius.circular(IMessageBubble.kRadius),
              bottomLeft: Radius.circular(
                showTail ? 4 : IMessageBubble.kRadius,
              ),
              bottomRight: const Radius.circular(IMessageBubble.kRadius),
            ),
          ),
          child: child,
        ),
        if (showTail)
          Positioned(
            bottom: 0,
            left: 0,
            child: CustomPaint(
              painter: IMessageBubble.tailPainter(
                color: color,
                isSender: false,
              ),
              size: const Size(
                IMessageBubble.kTailWidth,
                IMessageBubble.kTailHeight,
              ),
            ),
          ),
      ],
    );
  }
}
