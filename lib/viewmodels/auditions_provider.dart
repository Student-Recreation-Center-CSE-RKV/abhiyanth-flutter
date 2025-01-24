import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/auditions_service.dart';

// Create a service provider
final AuditionsServiceProvider = Provider<AuditionsService>((ref) {
  return AuditionsService();
});

// Create a Notifier to manage the state of Ongoing Auditions
class AuditionsNotifier extends StateNotifier<AsyncValue<List<Map<String, String>>>> {
  final AuditionsService _service;

  AuditionsNotifier(this._service) : super(const AsyncValue.loading());

  // Fetch ongoing Auditions
  Future<void> fetchOngoingAuditions() async {
    try {
      state = const AsyncValue.loading();
      final data = await _service.getOngoingAuditions();
      state = AsyncValue.data(data);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }
}

// Create a StateNotifierProvider for the notifier
final AuditionsProvider =
    StateNotifierProvider<AuditionsNotifier, AsyncValue<List<Map<String, String>>>>(
  (ref) => AuditionsNotifier(ref.watch(AuditionsServiceProvider)),
);
