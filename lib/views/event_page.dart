
import 'package:abhiyanth/widgets/event_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:abhiyanth/widgets/audition_card_widget.dart';
import 'package:abhiyanth/widgets/gradient_border.dart';
import 'package:abhiyanth/services/size_config.dart';

class EventPage extends StatefulWidget {
  const EventPage({super.key});

  @override
  State<EventPage> createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: const EdgeInsets.only(bottom: 16.0,left: 16.0,right: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: ListView(
                padding: const EdgeInsets.only(bottom: 16.0),
                children: [
                  Padding(
                    padding: EdgeInsets.all(SizeConfig.safeBlockHorizontal * 5),
                    child: BorderGradient(
                      borderWidth: 6.0,
                      gradientColors: const [
                        Color(0xFFFF6AB7),
                        Color(0xFF6AE4FF)
                      ],
                      borderRadius: BorderRadius.circular(
                          SizeConfig.safeBlockHorizontal * 5),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: SizeConfig.safeBlockHorizontal * 20),
                        child: Text(
                          "Events",
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
                  const EventCard(
                    date: "28-02-25",
                    title: "Anime",
                    location: "at s122",
                    imageUrl:
                        "https://i.pinimg.com/originals/5f/47/3e/5f473e7e1460acc093943bbf44889e39.gif",
                  ),
                  const SizedBox(height: 16.0),
                  const EventCard(
                    date: "28-02-25",
                    title: "Flashmob",
                    location: "at YSR Statue",
                    imageUrl:
                        "https://i.pinimg.com/originals/6c/12/cd/6c12cde612e399ca90b07afa11ac3af8.gif",
                  ),
                  const SizedBox(height: 16.0),
                  const EventCard(
                    date: "28-02-25",
                    title: "Hackathon",
                    location: "at Computer Center",
                    imageUrl:
                        "https://i.pinimg.com/originals/f7/81/2e/f7812e1249081221bb80abb048698308.gif",
                  ),
                  const SizedBox(height: 16.0),
                  const EventCard(
                    date: "28-02-25",
                    title: "Cultural Night",
                    location: "at Stage",
                    imageUrl:
                        "https://i.pinimg.com/originals/5a/56/0d/5a560dde2f98223f1967e05f8077b30f.gif",
                  ),
                ],
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}
