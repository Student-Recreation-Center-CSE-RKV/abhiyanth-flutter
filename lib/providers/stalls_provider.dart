import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/stalls_service.dart';
import '../models/stalls_model.dart';

// Provider for Stalls Service
final stallsServiceProvider = Provider<StallsService>((ref) {
  return StallsService();
});

// Notifier to manage stalls state
class StallsNotifier extends StateNotifier<AsyncValue<List<StallModel>>> {
  final StallsService _service;

  StallsNotifier(this._service) : super(const AsyncValue.loading()) {
    fetchStalls();
  }

  // Fetch stalls data from Firestore
  Future<void> fetchStalls() async {
    try {
      state = const AsyncValue.loading();
      final stalls = await _service.getStalls();
      state = AsyncValue.data(stalls);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }
}

// StateNotifierProvider for stalls
final stallsProvider = StateNotifierProvider<StallsNotifier, AsyncValue<List<StallModel>>>(
  (ref) => StallsNotifier(ref.watch(stallsServiceProvider)),
);
