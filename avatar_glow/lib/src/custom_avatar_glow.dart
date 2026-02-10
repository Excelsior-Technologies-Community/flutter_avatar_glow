import 'package:flutter/material.dart';

class CustomAvatarGlow extends StatefulWidget {
  final Widget child;
  final Color glowColor;
  final double startRadius;
  final double endRadius;
  final Duration duration;
  final bool repeat;
  final bool animate;

  const CustomAvatarGlow({
    super.key,
    required this.child,
    this.glowColor = Colors.blue,
    this.startRadius = 40,
    this.endRadius = 80,
    this.duration = const Duration(seconds: 2),
    this.repeat = true,
    this.animate = true,
  });

  @override
  State<CustomAvatarGlow> createState() => _CustomAvatarGlowState();
}

class _CustomAvatarGlowState extends State<CustomAvatarGlow>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _radiusAnimation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    _radiusAnimation = Tween<double>(
      begin: widget.startRadius,
      end: widget.endRadius,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));

    _opacityAnimation = Tween<double>(
      begin: 0.4,
      end: 0.0,
    ).animate(_controller);

    if (widget.animate) {
      widget.repeat ? _controller.repeat() : _controller.forward();
    }
  }

  @override
  void didUpdateWidget(CustomAvatarGlow oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.animate && !_controller.isAnimating) {
      widget.repeat ? _controller.repeat() : _controller.forward();
    } else if (!widget.animate && _controller.isAnimating) {
      _controller.stop();
    }
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
      builder: (_, __) {
        return Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: _radiusAnimation.value * 2,
              height: _radiusAnimation.value * 2,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: widget.glowColor.withOpacity(
                  _opacityAnimation.value,
                ),
              ),
            ),
            widget.child,
          ],
        );
      },
    );
  }
}
