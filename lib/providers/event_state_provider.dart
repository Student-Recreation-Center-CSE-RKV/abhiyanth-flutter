// import 'package:abhiyanth/models/department_event_model.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import '../services/event_service.dart';
//
// // Create a service provider
// final eventServiceProvider = Provider<EventService>((ref) {
//   return EventService();
// });
//
// // Create a Notifier to manage the state of events
// class EventNotifier extends StateNotifier<AsyncValue<DepartmentEventModel>>  {
//   final EventService _service;
//
//   EventNotifier(this._service) : super(const AsyncValue.loading());
//
//   Future<void> fetchEvents() async {
//     try {
//       state = const AsyncValue.loading();
//       final data = await _service.getEvents();
//       state = AsyncValue.data(data);
//     } catch (e) {
//       state = AsyncValue.error(e, StackTrace.current);
//     }
//   }
// }
//
// // Create a StateNotifierProvider for the notifier
// final eventProvider = StateNotifierProvider<EventNotifier, AsyncValue<DepartmentEventModel>>(
//   (ref) => EventNotifier(ref.watch(eventServiceProvider)),
// );

import 'package:abhiyanth/models/department_event_model.dart';
import 'package:abhiyanth/services/event_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Provider for DepartmentEventService
final eventServiceProvider = Provider<EventService>((ref) {
  return EventService();
});

/// StateNotifier for managing tech events data
class EventNotifier extends StateNotifier<AsyncValue<DepartmentEventModel>> {
  final EventService _service;

  EventNotifier(this._service) : super(const AsyncValue.loading());

  /// Fetch all tech events and categorize them into ongoing and upcoming
  Future<void> fetchEvents() async {
    try {
      state = const AsyncValue.loading();
      final data = await _service.getEvents();
      state = AsyncValue.data(data);
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
    }
  }
}

/// StateNotifierProvider for TechEventsNotifier
final eventProvider =StateNotifierProvider<EventNotifier, AsyncValue<DepartmentEventModel>>(
      (ref) => EventNotifier(ref.watch(eventServiceProvider)),
);
