import 'package:abhiyanth/widgets/event_card_widget.dart';
import 'package:abhiyanth/widgets/image_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:abhiyanth/services/size_config.dart';
import 'package:abhiyanth/utilities/gradient_background.dart';
import '../providers/culturals_provider.dart';

final List<Map<String, String>> ongoingCulturals = [
  {
    'image':
        'https://abhiyanthrkv.in/static/media/gallery_main2.fea4b3a13639b4f318a3.webp',
    'text': 'Kuchipudi',
  },
  {
    'image':
        'https://i.pinimg.com/236x/35/dd/ae/35ddaea600bef05e3920343b743ea730.jpg',
    'text': 'Bharathanatyam',
  },
];

class CulturalsPage extends ConsumerStatefulWidget {
  const CulturalsPage({super.key});
  @override
  ConsumerState<CulturalsPage> createState() => _CulturalsPageState();
}

class _CulturalsPageState extends ConsumerState<CulturalsPage> {
  @override
  void initState() {
    super.initState();

    // Fetch ongoing culturals when the page is loaded
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(culturalsProvider.notifier).fetchOngoingCulturals();
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    // Watch the ongoing culturals state
    final ongoingCulturalsState = ref.watch(culturalsProvider);

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
                "Ongoing Culturals",
                style: TextStyle(
                  color: Colors.lightBlueAccent,
                  fontSize: 22,
                  fontFamily: "Audiowide",
                  fontWeight: FontWeight.w400,
                ),
              ),
              // Display the Image Slider based on state
              ongoingCulturalsState.when(
                data: (items) => ImageSliderWidget(items: items),
                loading: () => const Center(
                  child: CircularProgressIndicator(color: Colors.white),
                ),
                error: (error, _) => Center(
                  child: Text(
                    "Error loading ongoing culturals: $error",
                    style: const TextStyle(color: Colors.red),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                "Upcoming Culturals",
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
                date: "DateTime.now()",
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
