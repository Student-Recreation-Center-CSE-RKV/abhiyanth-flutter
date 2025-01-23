import 'package:abhiyanth/viewmodels/auditions_provider.dart';
import 'package:abhiyanth/widgets/image_slider.dart';
import 'package:flutter/material.dart';
import 'package:abhiyanth/services/size_config.dart';
import 'package:abhiyanth/utilities/gradient_background.dart';
import 'package:abhiyanth/widgets/event_card_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuditionsPage extends ConsumerStatefulWidget {
  const AuditionsPage({super.key});

  @override
  ConsumerState<AuditionsPage> createState() => _AuditionsPageState();
}

class _AuditionsPageState extends ConsumerState<AuditionsPage> {
  @override
  void initState() {
    super.initState();

    // Fetch auditions when the page is loaded
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(auditionsProvider.notifier).fetchAuditions();
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    // Watch the auditions state
    final auditionsState = ref.watch(auditionsProvider);

    return GradientBackground(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const Text(
            "Abhiyanth 2K25",
            style: TextStyle(
              fontFamily: "Audiowide",
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            color: Colors.white,
            iconSize: SizeConfig.safeBlockHorizontal * 6,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          elevation: 0,
        ),
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.safeBlockHorizontal * 4),
          child: auditionsState.when(
            data: (auditions) {
              final ongoingAuditions = auditions['ongoing'] ?? [];
              final upcomingAuditions = auditions['upcoming'] ?? [];
              print(upcomingAuditions);
              print(ongoingAuditions);

              return ListView(
                children: [
                  const Text(
                    "Ongoing Auditions",
                    style: TextStyle(
                      color: Colors.lightBlueAccent,
                      fontSize: 22,
                      fontFamily: "Audiowide",
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  ImageSliderWidget(items: ongoingAuditions),
                  const SizedBox(height: 16),
                  const Text(
                    "Upcoming Auditions",
                    style: TextStyle(
                      color: Colors.lightBlueAccent,
                      fontSize: 22,
                      fontFamily: "Audiowide",
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 16),
                  ...upcomingAuditions.map((audition) {
                    return AuditionCard(
                      title: audition['title'] ?? 'No Title',
                      date: audition['date_time'] ?? 'No Date',
                      time: audition['time'] ?? 'No Time',
                      venue: audition['venue'] ?? 'No Venue',
                      description: audition['description'] ?? 'No Description',
                    );
                  }).toList(),
                ],
              );
            },
            loading: () => const Center(
              child: CircularProgressIndicator(color: Colors.white),
            ),
            error: (error, _) => Center(
              child: Text(
                "Error loading auditions: $error",
                style: const TextStyle(color: Colors.red),
              ),
            ),
          ),
        ),
      ),
    );
  }
}


final List<Map<String, String>> ongoingAuditions = [
  {'image': 'https://i.pinimg.com/236x/42/dc/0c/42dc0c3f341a3b336b2ae285f5c873de.jpg', 'text': 'Dance'},
  {'image': 'https://i.pinimg.com/236x/f9/16/24/f91624fb979cbc8586caf527501a921a.jpg', 'text': 'Singing'},
  {'image': 'https://i.pinimg.com/236x/c8/e9/e6/c8e9e64d5a7f1fefbcf43978419b5a72.jpg', 'text': 'Acting'},
];