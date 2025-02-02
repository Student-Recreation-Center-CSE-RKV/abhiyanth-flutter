import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/culturals_service.dart';
import 'package:abhiyanth/models/culturals_model.dart';

// Create a service provider
final culturalsServiceProvider = Provider<CulturalsService>((ref) {
  return CulturalsService();
});

class CulturalsNotifier extends StateNotifier<AsyncValue<List<CulturalsModel>>> {
  final CulturalsService _service;

  CulturalsNotifier(this._service) : super(const AsyncValue.loading());

  Future<void> fetchCulturals() async {
    try {
      state = const AsyncValue.loading();
      final data = await _service.getCulturals();
      state = AsyncValue.data(data);
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
    }
  }
}

// Create a StateNotifierProvider for the notifier
final culturalsProvider =
StateNotifierProvider<CulturalsNotifier, AsyncValue<List<CulturalsModel>>>(
      (ref) => CulturalsNotifier(ref.watch(culturalsServiceProvider)),
);
