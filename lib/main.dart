import 'package:abhiyanth/services/Routes/routesname.dart';
import 'package:flutter/material.dart';
import 'package:abhiyanth/services/Routes/routes.dart';
void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Scaffold(

      ),
      initialRoute: RoutesName.splash,
     onGenerateRoute: Routes.generateRoute,
    );
  }
}
