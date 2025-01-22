import 'dart:async';
import 'package:abhiyanth/services/Routes/navigation_service.dart';
import 'package:abhiyanth/services/Routes/routesname.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // App Logo
            Image.asset(
              'assets/images/abhiyanthlogo.jpg',
              width: SizeConfig.safeBlockHorizontal! * 40,
            ),
            SizedBox(height: SizeConfig.safeBlockVertical! * 2),
            Text(
              "Welcome to Abhiyanth App",
              style: TextStyle(
                color: Colors.black,
                fontSize: SizeConfig.safeBlockHorizontal! * 6,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: SizeConfig.safeBlockVertical! * 2),
            // Loading Spinner
            SpinKitSquareCircle(
              color: Colors.blue,
              size: 50.0,
              controller: _controller,
            ),
          ],
        ),
      ),
    );
  }
}
