import 'package:abhiyanth/providers/departments/mech_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../services/size_config.dart';
import '../../utilities/gradient_background.dart';
import '../../widgets/event_card_widget.dart';
import '../../widgets/gradient_border.dart';
import '../../widgets/image_slider.dart';

class ME extends ConsumerStatefulWidget {
  const ME({Key? key}) : super(key: key);

  @override
  ConsumerState<ME> createState() => _MEState();
}

class _MEState extends ConsumerState<ME> {
  @override
  void initState() {
    super.initState();
    // Fetch tech events when the page loads
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(mechEventsProvider.notifier).fetchTechEvents();
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    // Watch the state of the tech events provider
    final techEventsState = ref.watch(mechEventsProvider);

    return GradientBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
          leadingWidth: 60,
          backgroundColor: Colors.transparent,
          title: const Text(
            "Abhiyanth 2K25",
            style: TextStyle(color: Colors.white, fontFamily: "Audiowide"),
          ),
        ),
        body: techEventsState.when(
          data: (events) {
            final ongoingEvents = events['ongoing'] ?? [];
            final upcomingEvents = events['upcoming'] ?? [];

            return SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(SizeConfig.safeBlockHorizontal * 5),
                    child: BorderGradient(
                      borderWidth: 6.0,
                      gradientColors: const [
                        Color(0xFFFF6AB7),
                        Color(0xFF6AE4FF)
                      ],
                      borderRadius: BorderRadius.circular(
                          SizeConfig.safeBlockHorizontal * 5),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: SizeConfig.safeBlockHorizontal * 20),
                        child: Text(
                          "ME - Aadhya",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Audiowide",
                            fontSize: SizeConfig.safeBlockHorizontal * 5,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: SizeConfig.safeBlockVertical * 3),
                  const Text(
                    "Ongoing Events",
                    style: TextStyle(
                      color: Colors.lightBlueAccent,
                      fontSize: 22,
                      fontFamily: "Audiowide",
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: SizeConfig.safeBlockVertical * 2),
                  if (ongoingEvents.isNotEmpty)
                    ImageSliderWidget(
                      items: ongoingEvents.map((e) {
                        return {
                          'image':
                              e['image'] ?? 'https://via.placeholder.com/150',
                          'text': e['title'] ?? 'No Title',
                        };
                      }).toList(),
                    )
                  else
                    const Center(
                      child: Text(
                        "No Ongoing Events",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  const SizedBox(height: 16),
                  const Text(
                    "Upcoming Events",
                    style: TextStyle(
                      color: Colors.lightBlueAccent,
                      fontSize: 22,
                      fontFamily: "Audiowide",
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 16),
                  ...upcomingEvents.map(
                    (event) {
                      return AuditionCard(
                        image : event['image'] ?? 'https://via.placeholder.com/150',
                        title: event['title'] ?? 'No Title',
                        date: event['date'] ?? 'No Date',
                        time: event['time'] ?? 'No Time',
                        venue: event['venue'] ?? 'No Venue',
                        description: event['description'] ?? 'No Description',
                      );
                    },
                  ),
                ],
              ),
            );
          },
          loading: () => Center(
            child: LoadingAnimationWidget.inkDrop(
              color: Colors.white,
              size: SizeConfig.safeBlockHorizontal * 10,
            ),
          ),
          error: (error, _) => Center(
            child: Text(
              "Error loading events: $error",
              style: const TextStyle(color: Colors.red),
            ),
          ),
        ),
      ),
    );
  }
}
