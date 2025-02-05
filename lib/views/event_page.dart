import 'package:abhiyanth/services/size_config.dart';
import 'package:abhiyanth/widgets/glowing_logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/event_state_provider.dart';
import '../widgets/main_event_card_widget.dart';
import '../widgets/gradient_border.dart';

class EventPage extends ConsumerStatefulWidget {
  const EventPage({super.key});

  @override
  ConsumerState<EventPage> createState() => _EventPageState();
}

class _EventPageState extends ConsumerState<EventPage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(eventProvider.notifier).fetchEvents();
    });
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
              child: eventState.when(
                  data: (allEvents){
                    final events=allEvents.ongoingEvents;
                    return    ListView.builder(
                      itemCount: events.length,
                      itemBuilder: (context, index) {
                        final event = events[index];

                        return Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: SizeConfig.safeBlockVertical * 1.0,
                          ),
                          child: GestureDetector(
                            // onTap: () => _navigateToEventDetail(context, eve),
                            child: EventCard(
                             event: event,
                              // entryFee: event['entry_fee'] ?? 'Free',
                            ),
                          ),
                        );
                      },
                    );
                  },
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
          ],
        ),
      ),
    );
  }
}
