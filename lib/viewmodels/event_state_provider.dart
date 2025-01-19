import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/event_service.dart';

final eventServiceProvider = Provider<EventService>((ref) => EventService());

class EventNotifier extends StateNotifier<AsyncValue<List<Map<String, dynamic>>>> {
  final EventService _eventService;

  EventNotifier(this._eventService) : super(const AsyncValue.loading());

  // Fetch events from Firestore
  Future<void> fetchEvents() async {
    try {
      state = const AsyncValue.loading();
      final events = await _eventService.getEvents();
      state = AsyncValue.data(events);
    } catch (e) {
      state = AsyncValue.error(e,StackTrace.current);
    }
  }
}

// Provider for EventNotifier
final eventProvider = StateNotifierProvider<EventNotifier, AsyncValue<List<Map<String, dynamic>>>>(
  (ref) => EventNotifier(ref.watch(eventServiceProvider)),
);
