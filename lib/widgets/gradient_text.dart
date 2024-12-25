import 'package:flutter/material.dart';

class GradientText extends StatelessWidget {
  final String text;
  final double size;
  final List<Color> gradientColors;

  const GradientText({
    super.key,
    required this.text,
    this.size = 28.0,
    this.gradientColors = const [Color(0xFFFF6AB7), Color(0xFF6AE4FF)],
  });

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (Rect bounds) {
        return LinearGradient(
          colors: gradientColors,
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ).createShader(bounds);
      },
      blendMode: BlendMode.srcIn,
      child: Text(text, style: TextStyle(fontSize: size)),
    );
  }
}
