import 'dart:async';
import 'package:abhiyanth/widgets/grid_animation.dart';
import 'package:flutter/material.dart';
import 'package:abhiyanth/services/Routes/navigation_service.dart';
import 'package:abhiyanth/services/Routes/routesname.dart';
import 'package:abhiyanth/services/size_config.dart';
import 'package:abhiyanth/widgets/powered_by_src.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  NavigationService navigationService = NavigationService();

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 4), _checkUserStatus);
  }

  void _checkUserStatus() {
    final User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      navigationService.pushReplacementScreen(RoutesName.home);
    } else {
      navigationService.pushReplacementScreen(RoutesName.login);
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Squares animation background
          const Positioned.fill(
            child: Squares(
              direction: 'diagonal',
              speed: 0.5,
              squareSize: 40,
              borderColor: Colors.white,
              hoverFillColor: Colors.black38,
            ),
          ),
          // Foreground content
          Center(
            child: Column(
              children: [
                SizedBox(height: SizeConfig.safeBlockVertical * 30),
                Image.asset(
                  'assets/images/Abhiyanthlogo2.png',
                  width: SizeConfig.safeBlockHorizontal * 40,
                ),
                SizedBox(height: SizeConfig.safeBlockVertical * 2),
                Text(
                  "Welcome to Abhiyanth 2K25",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: SizeConfig.safeBlockHorizontal * 4,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Audiowide",
                  ),
                ),
                SizedBox(height: SizeConfig.safeBlockVertical * 35),
                PoweredBySrc(
                  logoAssetPath: "assets/images/src_logo.png",
                  text: "Powered by SRC-CSE",
                  textStyle: TextStyle(color: Colors.white,fontFamily: "Audiowide",),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
