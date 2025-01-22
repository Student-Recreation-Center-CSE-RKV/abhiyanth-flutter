import 'package:abhiyanth/services/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../viewmodels/event_state_provider.dart';
import '../widgets/main_event_card_widget.dart';
import '../widgets/gradient_border.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class EventPage extends ConsumerStatefulWidget {
  const EventPage({super.key});

  @override
  ConsumerState<EventPage> createState() => _EventPageState();
}

class _EventPageState extends ConsumerState<EventPage> {
  void initstate() {
    super.initState();
    debugPrint("super.initstate");

    ref.read(eventProvider.notifier).fetchEvents();
    debugPrint("ref");
  }

  @override
  Widget build(BuildContext context) {
    // SizeConfig().init(context); // Initialize SizeConfig
    // super.initState();
    final eventState = ref.watch(eventProvider);

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: EdgeInsets.only(
          bottom: SizeConfig.safeBlockVertical * 2.0,
          left: SizeConfig.safeBlockHorizontal * 4.0,
          right: SizeConfig.safeBlockHorizontal * 4.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(SizeConfig.safeBlockHorizontal * 4.0),
              child: BorderGradient(
                borderWidth: SizeConfig.safeBlockHorizontal * 1.5,
                gradientColors: const [Color(0xFFFF6AB7), Color(0xFF6AE4FF)],
                borderRadius: BorderRadius.circular(
                  SizeConfig.safeBlockHorizontal * 4.0,
                ),
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.safeBlockHorizontal * 25.0,
                  ),
                  child: const Text(
                    "Events",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Audiowide",
                      fontSize: 20.0, // Use a fixed font size for titles
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            Expanded(
              child: eventState.when(
                data: (events) => ListView.builder(
                  itemCount: events.length,
                  itemBuilder: (context, index) {
                    final event = events[index];
                    return Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: SizeConfig.safeBlockVertical * 1.0,
                      ),
                      child: EventCard(
                        date: event['date'] ?? 'N/A',
                        title: event['title'] ?? 'No Title',
                        location: event['venue'] ?? 'No Location',
                        imageUrl: event['image'] ?? '',
                      ),
                    );
                  },
                ),
                loading: () => Center(
                  child: LoadingAnimationWidget.inkDrop(
                    color: Colors.white,
                    size: SizeConfig.safeBlockHorizontal * 10.0,
                  ),
                ),
                error: (error, stack) => Center(
                  child: Text(
                    "Error loading events: $error",
                    style: const TextStyle(color: Colors.red),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          debugPrint("FloatingActionButton pressed: Fetching events.");
          ref.read(eventProvider.notifier).fetchEvents(); // Trigger data fetch
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
