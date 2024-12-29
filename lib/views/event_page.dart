import 'package:abhiyanth/utilities/gradient_background.dart';
import 'package:flutter/material.dart';
import 'package:abhiyanth/widgets/event_card.dart';

class EventPage extends StatefulWidget {
  const EventPage({super.key});

  @override
  State<EventPage> createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title Text
            Text(
              "Upcoming Auditions",
              style: TextStyle(
                color: Colors.lightBlueAccent,
                fontSize: 22,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 16), // Space between title and card
            // Audition Card
            AuditionCard(
              title: "Singing",
              date: "Date: 1st Jan 2025",
              time: "Time: 5:00 PM",
              venue: "Venue: Auditorium",
              description: "Description: Solo singing.",
            ),
          ],
        ),
      ),
    );
  }
}


