import 'package:abhiyanth/widgets/image_slider.dart';
import 'package:abhiyanth/widgets/meet_the_team_widget.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

final List<Map<String, String>> items = [
  {"title": "Workshops", "image": "assets/images/abhiyanthlogo.jpg"},
  {"title": "Culturals", "image": "assets/images/abhiyanthlogo.jpg"},
  {"title": "Auditions", "image": "assets/images/abhiyanthlogo.jpg"},
  {"title": "Stalls", "image": "assets/images/abhiyanthlogo.jpg"},
  {"title": "Technical", "image": "assets/images/abhiyanthlogo.jpg"},
  {"title": "Non-Technical", "image": "assets/images/abhiyanthlogo.jpg"},
];

final List<Map<String, String>> sliderItems = [
  {'image': 'assets/images/abhiyanthlogo.jpg', 'text': 'Caption 1'},
  {'image': 'assets/images/abhiyanthlogo.jpg', 'text': 'Caption 2'},
  {'image': 'assets/images/abhiyanthlogo.jpg', 'text': 'Caption 3'},
];

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent, // Background color
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            // Dashboard header

            ImageSliderWidget(items: sliderItems),
            const SizedBox(height: 20),
            // Circular buttons
            GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, // 3 items per row
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                childAspectRatio: 1, // Ensures items are square
              ),
              padding: const EdgeInsets.all(16.0),
              itemCount: 6, // Increase this count dynamically in the future
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage(items[index]["image"]!),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      items[index]["title"]!,
                      style: const TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ],
                );
              },
            ),
            const SizedBox(height: 20),
            const MeetTheTeamWidget(),
          ],
        ),
      ),
    );
  }
}
