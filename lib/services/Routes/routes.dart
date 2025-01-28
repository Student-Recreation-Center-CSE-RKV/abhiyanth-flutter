import 'package:abhiyanth/services/Routes/routesname.dart';
import 'package:abhiyanth/views/auditions_page.dart';
import 'package:abhiyanth/views/culturals_page.dart';
import 'package:abhiyanth/views/departments/chemical.dart';
import 'package:abhiyanth/views/departments/civil.dart';
import 'package:abhiyanth/views/departments/mechanical.dart';
import 'package:abhiyanth/views/departments/mme.dart';
import 'package:abhiyanth/views/notification_screen.dart';
import 'package:abhiyanth/views/signup_view.dart';
import 'package:abhiyanth/views/splash_screen.dart';
import 'package:abhiyanth/views/stalls_page.dart';
import 'package:abhiyanth/views/technicals_page.dart';
import 'package:abhiyanth/views/workshops_page.dart';
import 'package:flutter/material.dart';
import 'package:abhiyanth/views/home_page.dart';
import 'package:abhiyanth/views/aboutus_page.dart';
import '../../views/departments/cse.dart';
import '../../views/departments/ece.dart';
import '../../views/departments/eee.dart';

class Routes{
  static Route<dynamic> generateRoute(RouteSettings settings){
    switch(settings.name){
      case RoutesName.notification:
        return MaterialPageRoute(builder: (BuildContext context)=> NotificationScreen());
      case RoutesName.signup:
        return MaterialPageRoute(builder: (BuildContext context)=> SignupPage());
      case RoutesName.splash:
        return MaterialPageRoute(builder: (BuildContext context)=> SplashScreen());
      case RoutesName.home:
        return MaterialPageRoute(builder: (BuildContext context)=> HomePage());
      case RoutesName.aboutus:
        return MaterialPageRoute(builder: (BuildContext context)=> AboutUsPage());
      case RoutesName.technical:
        return MaterialPageRoute(builder: (BuildContext context)=> TechnicalsPage());
      case RoutesName.stalls:
        return MaterialPageRoute(builder: (BuildContext context)=> StallsPage());
      case RoutesName.auditions:
        return MaterialPageRoute(builder: (BuildContext context)=> AuditionsPage());
      case RoutesName.culturals:
        return MaterialPageRoute(builder: (BuildContext context)=> CulturalsPage());
      case RoutesName.workshop:
        return MaterialPageRoute(builder: (BuildContext context)=> WorkshopsPage());
      case RoutesName.mech:
        return MaterialPageRoute(builder: (BuildContext context)=>ME());
      case RoutesName.ece:
        return MaterialPageRoute(builder: (BuildContext context)=>ECE());
      case RoutesName.cse:
        return MaterialPageRoute(builder: (BuildContext context)=>CSE());
      case RoutesName.mme:
        return MaterialPageRoute(builder: (BuildContext context)=>MME());
      case RoutesName.chemical:
        return MaterialPageRoute(builder: (BuildContext context)=>Chemical());
      case RoutesName.civil:
        return MaterialPageRoute(builder: (BuildContext context)=>Civil());
      case RoutesName.eee:
        return MaterialPageRoute(builder: (BuildContext context)=>EEE());
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