import 'package:flutter/material.dart';

class GradientBackground extends StatelessWidget {
  final Widget child;

  const GradientBackground({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF261E35), // Side color
            Colors.black, // Center color
            Colors.black, // Second black (extra stop)
            Colors.black, // Third black (extra stop)
            Color(0xFF261E35), // Side color
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          stops: [0.005, 0.4, 0.5, 0.6, 0.995],
        ),
      ),
      child: child,
    );
  }
}
