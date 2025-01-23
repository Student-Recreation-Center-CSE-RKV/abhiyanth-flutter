import 'package:abhiyanth/utilities/gradient_background.dart';
import 'package:flutter/material.dart';

class EventDetailPage extends StatelessWidget {
  final Map<String, dynamic> event;

  const EventDetailPage({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return GradientBackground(
      child: Scaffold(
        appBar: AppBar(
          title: Text(event['title'] ?? 'Event Details'),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              event['image'] != null
                  ? Image.network(event['image'], fit: BoxFit.cover)
                  : const SizedBox.shrink(),
              const SizedBox(height: 16),
              Text(
                event['title'] ?? 'No Title',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                event['description'] ?? 'No Description',
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Department: ${event['department'] ?? 'N/A'}',
                style: const TextStyle(color: Colors.white),
              ),
              Text(
                'Start Date: ${event['start_date'] ?? 'N/A'}',
                style: const TextStyle(color: Colors.white),
              ),
              Text(
                'End Date: ${event['end_date'] ?? 'N/A'}',
                style: const TextStyle(color: Colors.white),
              ),
              Text(
                'Prize Money: ₹${event['prize_money'] ?? 'N/A'}',
                style: const TextStyle(color: Colors.white),
              ),
              Text(
                'Entry Fee: ₹${event['entry_fee'] ?? 'N/A'}',
                style: const TextStyle(color: Colors.white),
              ),
              Text(
                'Team Size: ${event['team_size'] ?? 'N/A'}',
                style: const TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
