
import 'package:abhiyanth/models/department_event_model.dart';
import 'package:abhiyanth/services/department_event_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Provider for DepartmentEventService
final DepartmentEventProvider = Provider<DepartmentEventService>((ref) {
  return DepartmentEventService();
});

/// StateNotifier for managing tech events data
class TechEventsNotifier extends StateNotifier<AsyncValue<DepartmentEventModel>> {
  final DepartmentEventService _service;

  TechEventsNotifier(this._service) : super(const AsyncValue.loading());

  /// Fetch all tech events and categorize them into ongoing and upcoming
  Future<void> fetchTechEvents(String department) async {
    try {
      state = const AsyncValue.loading();
      final data = await _service.getTechEvents(department);
      state = AsyncValue.data(data);
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
    }
  }
}

/// StateNotifierProvider for TechEventsNotifier
final departmentEventProvider =
StateNotifierProvider<TechEventsNotifier, AsyncValue<DepartmentEventModel>>(
      (ref) => TechEventsNotifier(ref.watch(DepartmentEventProvider)),
);
