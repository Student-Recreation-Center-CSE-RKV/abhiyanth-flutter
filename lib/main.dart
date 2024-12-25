import 'package:abhiyanth/utilities/gradient_background.dart';
import 'package:flutter/material.dart';
import 'views/home_page.dart';
import 'package:abhiyanth/services/Routes/routesname.dart';
import 'package:abhiyanth/services/Routes/routes.dart';
void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MVVM Architecture Example',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
      ),
      home: const HomePage(),
      initialRoute: RoutesName.splash,
     onGenerateRoute: Routes.generateRoute,
    );
  }
}
