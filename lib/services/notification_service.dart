import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class NotificationServices {
  final FirebaseMessaging _messaging = FirebaseMessaging.instance;

  Future<String> getToken() async {
    String? token = await _messaging.getToken();
    return token!;
  }

  void firebaseInit(BuildContext context) {
    FirebaseMessaging.onMessage.listen((message) {
      showNotification(message);
    });



    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      print('App opened from notification: ${message.data}');
    });
  }
  Future<void> initializeNotification() async {
    await AwesomeNotifications().initialize(
      null,
      [
        NotificationChannel(
          channelGroupKey: 'abhiyanth_channel',
          channelKey: 'abhiyanth_channel',
          channelName: 'abhiyanth_channel',
          channelDescription: 'Notification channel for basic task',
          defaultColor: Colors.deepPurple,
          ledColor: Colors.red,
          importance: NotificationImportance.Max,
          channelShowBadge: true,
          onlyAlertOnce: true,
          playSound: true,
          criticalAlerts: true,
        )
      ],
      channelGroups: [
        NotificationChannelGroup(
          channelGroupKey: 'abhiyanth_channel',
          channelGroupName: "abhiyanth_channel",
        )
      ],
      debug: true,
    );

    await AwesomeNotifications().isNotificationAllowed().then((isAllowed) async {
      if (!isAllowed) {
        await AwesomeNotifications().requestPermissionToSendNotifications();
      }
    });

    await AwesomeNotifications().setListeners(
      onActionReceivedMethod: onActionReceivedMethod,
      onNotificationCreatedMethod: onNotificationCreatedMethod,
      onNotificationDisplayedMethod: onNotificationDisplayedMethod,
      onDismissActionReceivedMethod: onDismissActionReceivedMethod,
    );
  }

  static Future<void> onActionReceivedMethod(ReceivedAction receivedAction) async {
    debugPrint("On Action Received");
    debugPrint("Payload: ${receivedAction.payload}");

    String? page = receivedAction.payload?['page'];
    debugPrint("Page to navigate: $page");

    // if (page == 'menu') {
    //   navigationService.pushScreen('menu');
    // } else {
    //   debugPrint("No matching page found!");
    // }
  }


  Future<void> onNotificationCreatedMethod(
      ReceivedNotification notification) async {
    debugPrint("On Notification Created Method");
  }

  Future<void> onNotificationDisplayedMethod(
      ReceivedNotification recivedAction) async {
    debugPrint("On Notification Displayed");
  }

  Future<void> onDismissActionReceivedMethod(ReceivedAction recivedAction) async {
    debugPrint("On Notification Received");
  }

  Future<void> showNotification(RemoteMessage message ) async {
    print("got notification");
    final Map<String, String?> payload = message.data.map((key, value) => MapEntry(key, value.toString()));
    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: -1,
        channelKey: 'abhiyanth_channel',
        title:message.data['title'],
        body: message.data['body'],
        summary: message.data['summary'],
        bigPicture: message.data['bigPicture'],
        notificationLayout: message.data['bigPicture'] != null
            ? NotificationLayout.BigPicture
            : NotificationLayout.BigText,
        payload:payload,
      ),
    );
  }
}