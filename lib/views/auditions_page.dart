import 'package:abhiyanth/viewmodels/auditions_provider.dart';
import 'package:abhiyanth/widgets/image_slider.dart';
import 'package:flutter/material.dart';
import 'package:abhiyanth/services/size_config.dart';
import 'package:abhiyanth/utilities/gradient_background.dart';
import 'package:abhiyanth/widgets/event_card_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final List<Map<String, String>> ongoingAuditions = [
  {'image': 'https://i.pinimg.com/236x/42/dc/0c/42dc0c3f341a3b336b2ae285f5c873de.jpg', 'text': 'Dance'},
  {'image': 'https://i.pinimg.com/236x/f9/16/24/f91624fb979cbc8586caf527501a921a.jpg', 'text': 'Singing'},
  {'image': 'https://i.pinimg.com/236x/c8/e9/e6/c8e9e64d5a7f1fefbcf43978419b5a72.jpg', 'text': 'Acting'},
];

class AuditionsPage extends ConsumerStatefulWidget {
  const AuditionsPage({super.key});

  @override
  ConsumerState<AuditionsPage> createState() => _AuditionsPageState();
}

class _AuditionsPageState extends ConsumerState<AuditionsPage> {
  @override
  void initState() {
    super.initState();

    // Fetch ongoing Auditions when the page is loaded
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(AuditionsProvider.notifier).fetchOngoingAuditions();
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    // Watch the ongoing Auditions state
    final ongoingAuditionsState = ref.watch(AuditionsProvider);

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: SizeConfig.safeBlockVertical * 2),
              const Text(
                "Ongoing Auditions",
                style: TextStyle(
                  color: Colors.lightBlueAccent,
                  fontSize: 22,
                  fontFamily: "Audiowide",
                  fontWeight: FontWeight.w400,
                ),
              ),
              // Display the Image Slider based on state
              ongoingAuditionsState.when(
                data: (items) => ImageSliderWidget(items: items),
                loading: () => const Center(
                  child: CircularProgressIndicator(color: Colors.white),
                ),
                error: (error, _) => Center(
                  child: Text(
                    "Error loading ongoing Auditions: $error",
                    style: const TextStyle(color: Colors.red),
                  ),
                ),
              ),
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
              AuditionCard (
                title: "Build your 3D anime Character",
                date: "1st March 2025",
                time: '',
                venue: '',
                description: '',
                image: '',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
