import 'package:flutter/material.dart';
import '../../services/size_config.dart';
import '../../utilities/gradient_background.dart';
import '../../widgets/event_card_widget.dart';
import '../../widgets/gradient_border.dart';
import '../../widgets/image_slider.dart';
class ME extends StatefulWidget{
  @override
  State<ME> createState() => _MEState();
}

class _MEState extends State<ME> {
  final List<Map<String, String>> upcomingEvents = [
    {'image': 'https://images.app.goo.gl/2D1hZ2Vn4thCm9fs7.jpg', 'text': 'Drones'},
    {'image': 'https://images.app.goo.gl/FRPUzCakQq4vBbaj9.jpg', 'text': 'Blockchain'},
  ];

  @override
  Widget build(BuildContext context){
    return GradientBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          leading: Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: SizeConfig.safeBlockHorizontal*5,
          ),
          leadingWidth: 60,
          backgroundColor: Colors.transparent,
          title: const Text(
            "Abhiyanth 2K25",
            style: TextStyle(color: Colors.white, fontFamily: "Audiowide"),
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(SizeConfig.safeBlockHorizontal * 5),
              child: BorderGradient(
                borderWidth: 6.0,
                gradientColors: const [Color(0xFFFF6AB7), Color(0xFF6AE4FF)],
                borderRadius: BorderRadius.circular(SizeConfig.safeBlockHorizontal * 5),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: SizeConfig.safeBlockHorizontal * 20),
                  child: Text(
                    "ME - Mechanza",
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
            SizedBox(height:SizeConfig.safeBlockVertical*3),

            ImageSliderWidget(items: upcomingEvents),
            const Text(
              "Programs",
              style: TextStyle(
                color: Colors.lightBlueAccent,
                fontSize: 22,
                fontFamily: "Audiowide",
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 16), // Space between title and card

            // Audition Card Widget
            EventCard(
              title: "Build your 3D anime Character",
              date: "1st March 2025",
              location: '', imageUrl: '',
            ),
          ],
        ),
      ),
    );
  }
}