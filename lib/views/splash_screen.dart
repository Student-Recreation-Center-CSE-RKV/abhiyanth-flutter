import 'dart:async';
import 'package:abhiyanth/services/Routes/navigation_service.dart';
import 'package:abhiyanth/services/Routes/routesname.dart';
import 'package:abhiyanth/widgets/powered_by_src.dart';
import 'package:flutter/material.dart';
import 'package:abhiyanth/services/size_config.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  late final AnimationController _controller;
  NavigationService navigationService=NavigationService();
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat();


    Timer(const Duration(seconds: 4), _checkUserStatus);
  }
  void _checkUserStatus() {
  Navigator.pushReplacementNamed(context, RoutesName.login);
    final User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      navigationService.pushReplacementScreen(RoutesName.home);
    } else {
      navigationService.pushReplacementScreen(RoutesName.login);
    }
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose of the animation controller
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // App Logo
            SizedBox(height: SizeConfig.safeBlockVertical* 30),
            Image.asset(
              'assets/images/abhiyanthlogo.jpg',
              width: SizeConfig.safeBlockHorizontal* 40,
            ),
            SizedBox(height: SizeConfig.safeBlockVertical* 2),
            Text(
              "Welcome to Abhiyanth 2K25",
              style: TextStyle(
                color: Colors.black,
                fontSize: SizeConfig.safeBlockHorizontal* 4,
                fontWeight: FontWeight.bold,
                fontFamily : "Audiowide",
              ),
            ),
            SizedBox(height: SizeConfig.safeBlockVertical* 35),
            // Loading Spinner
            PoweredBySrc(logoAssetPath: "assets/images/src_logo.png", text: "Powered by SRC-CSE")
          ],
        ),
      ),
    );
  }
}
