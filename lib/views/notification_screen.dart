import 'package:abhiyanth/utilities/gradient_background.dart';
import 'package:abhiyanth/widgets/glowing_logo.dart';
import 'package:abhiyanth/widgets/notification_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:abhiyanth/providers/notifications_provider.dart';

import '../widgets/notification_popup.dart';

class NotificationScreen extends ConsumerStatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends ConsumerState<NotificationScreen> {
  @override
  void initState() {
    super.initState();
    // Fetch notifications on initialization
    Future.microtask(() {
      ref.read(notificationsProvider.notifier).fetchNotifications();
    });
  }

  // Refresh logic
  Future<void> _refreshPage() async {
    await ref.read(notificationsProvider.notifier).fetchNotifications();
  }

  @override
  Widget build(BuildContext context) {
    final notificationsState = ref.watch(notificationsProvider);

    return GradientBackground(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          ),
          backgroundColor: Colors.transparent,
          title: const Text(
            "Notifications",
            style: TextStyle(fontFamily: "Audiowide", color: Colors.white),
          ),
          centerTitle: true,
        ),
        backgroundColor: Colors.transparent,
        body: RefreshIndicator(
          onRefresh: _refreshPage, // Call the refresh method
          child: notificationsState.isLoading
              ? const Center(child: BlinkingLogo())
              : notificationsState.notifications.isEmpty
              ? const Center(child: Text("No notifications available"))
              : ListView.builder(
            physics: const AlwaysScrollableScrollPhysics(),
            itemCount: notificationsState.notifications.length,
            itemBuilder: (context, index) {
              final notification = notificationsState.notifications[index];
              return GestureDetector(
                onTap: () => showDialog(
                  context: context,
                  builder: (context) => NotificationDialog(notification: notification),
                ),
                child: NotificationItem(
                  notification: notification,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
