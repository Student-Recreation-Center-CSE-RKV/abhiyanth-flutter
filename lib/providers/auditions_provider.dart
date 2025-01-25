import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/auditions_service.dart';

final auditionsServiceProvider = Provider<AuditionsService>((ref) {
  return AuditionsService();
});

class AuditionsNotifier
    extends StateNotifier<AsyncValue<Map<String, List<Map<String, String>>>>> {
  final AuditionsService _service;

  AuditionsNotifier(this._service) : super(const AsyncValue.loading());

  // Fetch all auditions
  Future<void> fetchAuditions() async {
    try {
      state = const AsyncValue.loading();
      final data = await _service.getAuditions();
      state = AsyncValue.data(data);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }
}

final auditionsProvider = StateNotifierProvider<
    AuditionsNotifier,
    AsyncValue<Map<String, List<Map<String, String>>>>>(
  (ref) => AuditionsNotifier(ref.watch(auditionsServiceProvider)),
);
