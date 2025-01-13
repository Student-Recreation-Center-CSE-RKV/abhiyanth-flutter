import 'package:abhiyanth/widgets/image_slider.dart';
import 'package:flutter/material.dart';
import 'package:abhiyanth/services/size_config.dart';
import 'package:abhiyanth/utilities/gradient_background.dart';
import 'package:abhiyanth/widgets/audition_card_widget.dart';

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

class CulturalsPage extends StatelessWidget {
  const CulturalsPage({super.key});

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
            iconSize:
                SizeConfig.safeBlockHorizontal * 6, // Responsive icon size
            onPressed: () {
              Navigator.pop(context); // Navigate to previous page
            },
          ),
          elevation: 0,
        ),
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal:
                  SizeConfig.safeBlockHorizontal * 4), // Responsive padding
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
              ImageSliderWidget(items: ongoingCulturals),

              // Title Text
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
