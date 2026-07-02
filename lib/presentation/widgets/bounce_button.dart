import 'package:flutter/material.dart';

class BounceButton extends StatefulWidget {
  final Widget child;
  final VoidCallback onPressed;
  final double scaleFactor;
  final Duration duration;
  final HitTestBehavior behavior;

  const BounceButton({
    super.key,
    required this.child,
    required this.onPressed,
    this.scaleFactor = 0.92,
    this.duration = const Duration(milliseconds: 100),
    this.behavior = HitTestBehavior.opaque,
  });

  @override
  State<BounceButton> createState() => _BounceButtonState();
}

class _BounceButtonState extends State<BounceButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration);
    _scaleAnimation = Tween<double>(begin: 1.0, end: widget.scaleFactor)
        .animate(
          CurvedAnimation(parent: _controller, curve: Curves.easeInOutCubic),
        );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onPointerDown(PointerDownEvent event) {
    _controller.forward();
  }

  void _onPointerUp(PointerUpEvent event) {
    if (!mounted) return;
    _controller.reverse();
  }

  void _onPointerCancel(PointerCancelEvent event) {
    if (!mounted) return;
    _controller.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: _onPointerDown,
      onPointerUp: _onPointerUp,
      onPointerCancel: _onPointerCancel,
      behavior: widget.behavior,
      child: GestureDetector(
        behavior: widget.behavior,
        onTap: widget.onPressed,
        child: ScaleTransition(scale: _scaleAnimation, child: widget.child),
      ),
    );
  }
}
