import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: const Text(
          "About Us Page",
          style: TextStyle(color: Colors.white, fontFamily: "Audiowide"),
        ),
      ),
  );
  }
}