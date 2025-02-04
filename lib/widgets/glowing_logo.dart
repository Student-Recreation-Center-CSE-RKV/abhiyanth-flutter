import 'package:flutter/material.dart';

class BlinkingLogo extends StatefulWidget {
  final String logoPath;
  final double size;
  final Duration speed;

  const BlinkingLogo({
    Key? key,
    this.logoPath ="assets/images/Abhiyanthlogo2.png",
    this.size = 100.0,
    this.speed = const Duration(seconds: 2), // Default speed
  }) : super(key: key);

  @override
  _BlinkingLogoState createState() => _BlinkingLogoState();
}

class _BlinkingLogoState extends State<BlinkingLogo> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.speed,
    )..repeat(reverse: true); // Loops fade in & out

    _opacityAnimation = Tween<double>(begin: 1.0, end: 0.2).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _opacityAnimation,
      builder: (context, child) {
        return Opacity(
          opacity: _opacityAnimation.value,
          child: Image.asset(
            widget.logoPath,
            width: widget.size,
            height: widget.size,
            fit: BoxFit.cover,
          ),
        );
      },
    );
  }
}
