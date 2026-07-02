import 'package:flutter/material.dart';
import '../../../../domain/entities/message.dart';

class AnimatedMessageBubble extends StatefulWidget {
  final Message message;
  final bool isSender;
  final Widget child;
  final bool shouldAnimate;

  const AnimatedMessageBubble({
    super.key,
    required this.message,
    required this.isSender,
    required this.shouldAnimate,
    required this.child,
  });

  @override
  State<AnimatedMessageBubble> createState() => _AnimatedMessageBubbleState();
}

class _AnimatedMessageBubbleState extends State<AnimatedMessageBubble>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;
  late Animation<double> _sizeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    _opacityAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
    _sizeAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutCubic,
    );

    final now = DateTime.now();
    final difference = now.difference(widget.message.createdAt);
    if (widget.shouldAnimate && difference.inSeconds < 2) {
      _controller.forward();
    } else {
      _controller.value = 1.0;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      sizeFactor: _sizeAnimation,
      alignment: Alignment.topCenter,
      child: FadeTransition(opacity: _opacityAnimation, child: widget.child),
    );
  }
}
