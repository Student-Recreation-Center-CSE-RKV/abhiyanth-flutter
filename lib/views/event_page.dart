import 'package:abhiyanth/services/size_config.dart';
import 'package:abhiyanth/widgets/glowing_logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../viewmodels/event_state_provider.dart';
import '../widgets/main_event_card_widget.dart';
import '../widgets/gradient_border.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import './event_detail_page.dart';

class EventPage extends ConsumerStatefulWidget {
  const EventPage({super.key});

  @override
  ConsumerState<EventPage> createState() => _EventPageState();
}

class _EventPageState extends ConsumerState<EventPage> {
  @override
  void initState() {
    super.initState();

    // Delay the fetchEvents call until after the widget is built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(eventProvider.notifier).fetchEvents();
    });
  }

  Future<void> _refreshEvents() async {
    debugPrint("Pull to refresh triggered.");
    await ref.read(eventProvider.notifier).fetchEvents();
  }

  void _navigateToEventDetail(BuildContext context, Map<String, dynamic> event) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EventDetailPage(event: event),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
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
                      fontSize: 20.0,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            Expanded(
              child: RefreshIndicator(
                onRefresh: _refreshEvents,
                child: eventState.when(
                  data: (events) => ListView.builder(
                    itemCount: events.length,
                    itemBuilder: (context, index) {
                      final event = events[index];
                      return Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: SizeConfig.safeBlockVertical * 1.0,
                        ),
                        child: GestureDetector(
                          onTap: () => _navigateToEventDetail(context, event),
                          child: EventCard(
                            date: event['start_date_formatted'] ?? 'N/A',
                            title: event['title'] ?? 'No Title',
                            location: event['department'] ?? 'No Department',
                            imageUrl: event['image'] ?? '',
                            // prizeMoney: event['prize_money'] ?? 'No Prize',
                            // entryFee: event['entry_fee'] ?? 'Free',
                          ),
                        ),
                      );
                    },
                  ),
                  loading: () => const Center(
              child : BlinkingLogo(logoPath: "assets/images/Abhiyanthlogo2.png",),
              // child: CircularProgressIndicator(color: Colors.white),
            ),
                  error: (error, stack) => Center(
                    child: Text(
                      "Error loading events: $error",
                      style: const TextStyle(color: Colors.red),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
