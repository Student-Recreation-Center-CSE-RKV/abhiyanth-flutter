import 'package:flutter/material.dart';

class BorderGradient extends StatelessWidget {
  final List<Color> gradientColors;
  final BorderRadius borderRadius;
  final Widget child;

  const BorderGradient({
    super.key,
    required this.child,
    this.gradientColors = const [Color(0xFFFF6AB7), Color(0xFF6AE4FF)],
    required this. borderRadius,
    required double borderWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: gradientColors,
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: borderRadius,
      ),
      child: Container(
        margin: const EdgeInsets.all(2.0),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: borderRadius,
        ),
        child: child,
      ),
    );
  }
}
