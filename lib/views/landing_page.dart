import 'package:abhiyanth/utilities/gradient_background.dart';
import 'package:flutter/material.dart';


class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.transparent,
          body: Center(
            child: const Text(
              "Landing Page",
              style: TextStyle(color: Colors.white, fontFamily: "Audiowide"),
            ),
          ),
        );
  }
}
