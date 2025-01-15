import 'package:abhiyanth/widgets/image_slider.dart';
import 'package:flutter/material.dart';
import 'package:abhiyanth/services/size_config.dart';
import 'package:abhiyanth/utilities/gradient_background.dart';
import 'package:abhiyanth/widgets/audition_card_widget.dart';

final List<Map<String, String>> ongoingAuditions = [
  {'image': 'https://i.pinimg.com/236x/42/dc/0c/42dc0c3f341a3b336b2ae285f5c873de.jpg', 'text': 'Dance'},
  {'image': 'https://i.pinimg.com/236x/f9/16/24/f91624fb979cbc8586caf527501a921a.jpg', 'text': 'Singing'},
  {'image': 'https://i.pinimg.com/236x/c8/e9/e6/c8e9e64d5a7f1fefbcf43978419b5a72.jpg', 'text': 'Acting'},
];

class AuditionsPage extends StatelessWidget {
  const AuditionsPage({super.key});

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
              ImageSliderWidget(items: ongoingAuditions),
              // Title Text
              const Text(
                "Upcoming Auditions",
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
                title: "Singing",
                date: "1st Jan 2025",
                time: "5:00 PM",
                venue: "Auditorium",
                description: "Solo singing.",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
