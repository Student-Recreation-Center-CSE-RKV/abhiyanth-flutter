import 'package:flutter_riverpod/flutter_riverpod.dart';
import './event_state_provider.dart';

class EventViewModel {
  final WidgetRef ref;

  EventViewModel(this.ref);

  void refreshEvents() {
    ref.read(eventProvider.notifier).fetchEvents();
  }
}
