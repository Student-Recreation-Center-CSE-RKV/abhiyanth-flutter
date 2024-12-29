import 'package:flutter/material.dart';

class AuditionCard extends StatelessWidget {
  final String title;
  final String date;
  final String time;
  final String venue;
  final String description;

  const AuditionCard({super.key, 
    required this.title,
    required this.date,
    required this.time,
    required this.venue,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.transparent, // Dark background color for the card
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color:
              Colors.pinkAccent.withOpacity(0.6), // Border with gradient effect
          width: 2,
        ),
      ),
      child: Row(
        children: [
          // Image Placeholder
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.grey[400], // Light gray placeholder
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          const SizedBox(width: 16), // Spacing between image and text
          // Text Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.lightBlueAccent,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Audiowide",
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  date,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontFamily: "Audiowide",
                  ),
                ),
                Text(
                  time,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontFamily: "Audiowide",
                  ),
                ),
                Text(
                  venue,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontFamily: "Audiowide",
                  ),
                ),
                Text(
                  description,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontFamily: "Audiowide",
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}