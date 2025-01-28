import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:abhiyanth/services/get_notification_service.dart';

// Notification State class
class NotificationsState {
  final List<Map<String, dynamic>> notifications;
  final bool isLoading;

  NotificationsState({
    required this.notifications,
    required this.isLoading,
  });

  NotificationsState copyWith({
    List<Map<String, dynamic>>? notifications,
    bool? isLoading,
  }) {
    return NotificationsState(
      notifications: notifications ?? this.notifications,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

// Initial State
final NotificationsState initialNotificationsState = NotificationsState(
  notifications: [],
  isLoading: false,
);

// Notification Service Provider
final notificationServiceProvider = Provider<NotificationService>((ref) {
  return NotificationService();
});

// Notifications State Notifier
class NotificationsNotifier extends StateNotifier<NotificationsState> {
  final NotificationService _notificationService;

  NotificationsNotifier(this._notificationService)
      : super(initialNotificationsState);

  Future<void> fetchNotifications() async {
    state = state.copyWith(isLoading: true);
    try {
      final notifications = await _notificationService.getAllNotifications();
      state = state.copyWith(notifications: notifications, isLoading: false);
    } catch (e) {
      print('Error fetching notifications: $e');
      state = state.copyWith(isLoading: false);
    }
  }
}

// Notifications Provider
final notificationsProvider =
    StateNotifierProvider<NotificationsNotifier, NotificationsState>((ref) {
  final notificationService = ref.watch(notificationServiceProvider);
  return NotificationsNotifier(notificationService);
});
