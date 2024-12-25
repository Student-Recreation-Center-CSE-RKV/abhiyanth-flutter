import 'dart:async';
import 'package:abhiyanth/services/Routes/routesname.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:abhiyanth/services/size_config.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 4), () {
     Navigator.pushNamed(context, RoutesName.signup);
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return Scaffold(
      backgroundColor:Colors.white,
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

            SpinKitSquareCircle(
      color: Colors.blue,
          size: 50.0,
          controller: AnimationController(duration: const Duration(seconds: 5), vsync: this),
    ),
          ],
        ),
      ),
    );
  }
}
