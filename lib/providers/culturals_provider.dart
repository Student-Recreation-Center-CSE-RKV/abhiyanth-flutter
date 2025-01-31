import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/culturals_service.dart';

// Create a service provider
final culturalsServiceProvider = Provider<CulturalsService>((ref) {
  return CulturalsService();
});

class CulturalsNotifier extends StateNotifier<AsyncValue<List<Map<String, String>>>> {
  final CulturalsService _service;

  CulturalsNotifier(this._service) : super(const AsyncValue.loading());

  // Fetch ongoing culturals
  Future<void> fetchOngoingCulturals() async {
    try {
      state = const AsyncValue.loading();
      final data = await _service.getOngoingCulturals();
      state = AsyncValue.data(data);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }
}

// Create a StateNotifierProvider for the notifier
final culturalsProvider =
    StateNotifierProvider<CulturalsNotifier, AsyncValue<List<Map<String, String>>>>(
  (ref) => CulturalsNotifier(ref.watch(culturalsServiceProvider)),
);
