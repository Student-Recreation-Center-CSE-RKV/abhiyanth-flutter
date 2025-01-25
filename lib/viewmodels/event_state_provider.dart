import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/event_service.dart';

// Create a service provider
final eventServiceProvider = Provider<EventService>((ref) {
  return EventService();
});

// Create a Notifier to manage the state of events
class EventNotifier extends StateNotifier<AsyncValue<List<Map<String, dynamic>>>> {
  final EventService _service;

  EventNotifier(this._service) : super(const AsyncValue.loading());

  // Fetch events from Firestore
  Future<void> fetchEvents() async {
    try {
      state = const AsyncValue.loading();
      final data = await _service.getEvents();
      state = AsyncValue.data(data);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }
}

// Create a StateNotifierProvider for the notifier
final eventProvider = StateNotifierProvider<EventNotifier, AsyncValue<List<Map<String, dynamic>>>>(
  (ref) => EventNotifier(ref.watch(eventServiceProvider)),
);
