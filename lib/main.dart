import 'package:abhiyanth/services/Routes/routes.dart';
import 'package:abhiyanth/services/Routes/routesname.dart';
import 'package:abhiyanth/firebase_options.dart';
import 'package:abhiyanth/services/size_config.dart';
import 'package:abhiyanth/views/login_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:abhiyanth/views/home_page.dart';
import 'package:abhiyanth/views/login_view.dart';
import 'package:abhiyanth/views/splash_screen.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await Firebase.initializeApp();
  runApp(MyApp());
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