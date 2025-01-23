import 'package:abhiyanth/services/Routes/navigation_service.dart';
import 'package:abhiyanth/services/Routes/routes.dart';
import 'package:abhiyanth/services/Routes/routesname.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:abhiyanth/locator.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
Future<void> firebaseBackgroundHandler(RemoteMessage message) async {
  final Map<String, String?> payload = message.data.map((key, value) => MapEntry(key, value.toString()));

  await AwesomeNotifications().createNotification(
    content: NotificationContent(
      id: -1,
      channelKey: 'abhiyanth_channel',
      title: message.data['title'] ?? 'No Title',
      body: message.data['body'] ?? 'No Body',
      summary: message.data['summary'],
      bigPicture: message.data['bigPicture'],
      notificationLayout: message.data['bigPicture'] != null
          ? NotificationLayout.BigPicture
          : NotificationLayout.BigText,
      payload: payload,
    ),
  );
  notificationServices.showNotification(message);
}
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await dotenv.load(fileName: ".env");
  setUpLocator();
  FirebaseMessaging.onBackgroundMessage(firebaseBackgroundHandler);
  notificationServices.initializeNotification();
  notificationServices.getToken();
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
   MyApp({super.key});
   NavigationService navigationService=NavigationService();
   GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
   @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      navigatorKey:NavigationService.navigatorKey ,
      initialRoute:RoutesName.splash,
      onGenerateRoute:Routes.generateRoute,
    );
  }
}