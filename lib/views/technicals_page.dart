import 'package:abhiyanth/widgets/image_slider.dart';
import 'package:flutter/material.dart';
import 'package:abhiyanth/services/size_config.dart';
import 'package:abhiyanth/utilities/gradient_background.dart';
import 'package:abhiyanth/widgets/event_card_widget.dart';

final List<Map<String, String>> upcomingTechnicalEvents = [
  {'image': 'https://i.pinimg.com/236x/72/b9/b4/72b9b4cacff627b4d6201bafbcc78d6a.jpg', 'text': 'Coding Contest'},
  {'image': 'https://i.pinimg.com/236x/8e/3a/2b/8e3a2be2dd8e7ab7a0a745ba3892c351.jpg', 'text': 'Hackathon'},
];

class TechnicalsPage extends StatelessWidget {
  const TechnicalsPage({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context); // Initialize SizeConfig for responsive sizing

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
            iconSize: SizeConfig.safeBlockHorizontal * 6, // Responsive icon size
            onPressed: () {
              Navigator.pop(context); // Navigate to previous page
            },
          ),
          elevation: 0,
        ),
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: SizeConfig.safeBlockHorizontal * 4), // Responsive padding
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: SizeConfig.safeBlockVertical * 5), // Top margin (responsive)
              ImageSliderWidget(items: upcomingTechnicalEvents),
              // Title Text
              const Text(
                "Upcoming Technical Events",
                style: TextStyle(
                  color: Colors.lightBlueAccent,
                  fontSize: 22,
                  fontFamily: "Audiowide",
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 16), // Space between title and card

              // Audition Card Widget
              const AuditionCard(
                title: "Debate",
                date: "1st Jan 2025",
                time: "5:00 PM",
                venue: "AB2 S18",
                description: "Let your words have no boundary.",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
