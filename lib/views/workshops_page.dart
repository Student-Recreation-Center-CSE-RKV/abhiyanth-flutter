import 'package:abhiyanth/widgets/image_slider.dart';
import 'package:flutter/material.dart';
import 'package:abhiyanth/services/size_config.dart';
import 'package:abhiyanth/utilities/gradient_background.dart';
import 'package:abhiyanth/widgets/event_card_widget.dart';

final List<Map<String, String>> upcomingWorkshops = [
  {'image': 'https://i.pinimg.com/236x/eb/f7/ca/ebf7caf098ab81fb68328c116f6ab6e6.jpg', 'text': 'Drones'},
  {'image': 'https://i.pinimg.com/236x/ae/13/28/ae1328e595575928c994009a083b8bb4.jpg', 'text': 'Blockchain'},
];

class WorkshopsPage extends StatelessWidget {
  const WorkshopsPage({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context); 

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
              const Text("Ongoing Workshops",
              style: TextStyle(
                color: Colors.lightBlueAccent,
                fontSize: 22,
                fontFamily: "Audiowide",
                fontWeight: FontWeight.w400,
                ),
              ),
              ImageSliderWidget(items: upcomingWorkshops),
              // Title Text
              const Text(
                "Upcoming Workshops",
                style: TextStyle(
                  color: Colors.lightBlueAccent,
                  fontSize: 22,
                  fontFamily: "Audiowide",
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 16), // Space between title and card

              // Audition Card Widget

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
