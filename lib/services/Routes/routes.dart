import 'package:abhiyanth/services/Routes/routesname.dart';
import 'package:abhiyanth/views/login_view.dart';
import 'package:abhiyanth/views/signup_view.dart';
import 'package:abhiyanth/views/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Routes{
  static Route<dynamic> generateRoute(RouteSettings settings){
    switch(settings.name){
      case RoutesName.login:
        return MaterialPageRoute(builder: (BuildContext context)=>LoginPage());
      case RoutesName.signup:
        return MaterialPageRoute(builder: (BuildContext context)=> SignUpPage());
      case RoutesName.splash:
        return MaterialPageRoute(builder: (BuildContext context)=>SplashScreen());
      default:
        return MaterialPageRoute(builder: (_){
          return Scaffold(
            body: Center(
              child: Text('No Routes Defined'),
            ),
          );
        });
    }
  }
}