import 'package:abhiyanth/models/department_event_model.dart';
import 'package:abhiyanth/services/Routes/routesname.dart';
import 'package:abhiyanth/views/auditions_page.dart';
import 'package:abhiyanth/views/culturals_page.dart';
import 'package:abhiyanth/views/notification_screen.dart';
import 'package:abhiyanth/views/show_event_page.dart';
import 'package:abhiyanth/views/signup_view.dart';
import 'package:abhiyanth/views/splash_screen.dart';
import 'package:abhiyanth/views/stalls_page.dart';
import 'package:abhiyanth/views/technicals_page.dart';
import 'package:abhiyanth/views/workshops_page.dart';
import 'package:flutter/material.dart';
import 'package:abhiyanth/views/department_event_page.dart';
import 'package:abhiyanth/views/home_page.dart';
import 'package:abhiyanth/views/aboutus_page.dart';

class Routes{
  static Route<dynamic> generateRoute(RouteSettings settings){
    switch(settings.name){
      case RoutesName.showEvent:
        return MaterialPageRoute(builder: (BuildContext context)=> ShowEventPage(event: settings.arguments as Event));
      case RoutesName.departmentEvent:
        return MaterialPageRoute(builder: (BuildContext context)=> DepartmentEventPage(department: settings.arguments as String));
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