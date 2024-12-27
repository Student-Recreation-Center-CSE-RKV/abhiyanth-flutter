import 'package:abhiyanth/services/Routes/routes.dart';
import 'package:abhiyanth/services/Routes/routesname.dart';
import 'package:abhiyanth/services/size_config.dart';
import 'package:abhiyanth/views/login_view.dart';
import 'package:flutter/material.dart';
import 'package:abhiyanth/views/home_page.dart';
import 'package:abhiyanth/views/login_view.dart';
import 'package:abhiyanth/views/splash_screen.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      initialRoute:RoutesName.splash,
      onGenerateRoute:Routes.generateRoute,
    );
  }
}