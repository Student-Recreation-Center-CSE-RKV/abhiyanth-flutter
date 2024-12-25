import 'package:abhiyanth/utilities/gradient_background.dart';
import 'package:flutter/material.dart';


class EventPage extends StatefulWidget {
  const EventPage({super.key});

  @override
  State<EventPage> createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
    backgroundColor: Colors.transparent,
          body: Center(
            child: const Text(
              "Event Page",
              style: TextStyle(color: Colors.white, fontFamily: "Audiowide"),
            ),
          ),
        );
  }
}
