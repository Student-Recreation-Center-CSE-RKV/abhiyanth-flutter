import 'package:flutter/material.dart';
import 'package:abhiyanth/services/size_config.dart';
import 'package:abhiyanth/utilities/gradient_background.dart';
import 'package:abhiyanth/widgets/event_card_widget.dart';

class StallsPage extends StatelessWidget {
  const StallsPage({super.key});

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
              SizedBox(height: SizeConfig.safeBlockVertical * 5), // Top margin (responsive)

              // Title Text
              const Text(
                "Stalls",
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
                title: "Chicken Day",
                date: "27 Feb 2025",
                time: "All day",
                venue: "SAC",
                description: "Eat to your fullest.",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
