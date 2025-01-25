import 'package:flutter/material.dart';

class AuditionCard extends StatelessWidget {
  final String title;
  final String date;
  final String time;
  final String venue;
  final String description;
  final String image;

  const AuditionCard({
    super.key,
    required this.title,
    required this.date,
    required this.time,
    required this.venue,
    required this.description,
    this.image =
        "https://i.pinimg.com/236x/42/dc/0c/42dc0c3f341a3b336b2ae285f5c873de.jpg",
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.transparent,
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
              borderRadius: BorderRadius.circular(12),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                image, // Replace `image` with your local variable containing the URL
                width: 100,
                height: 100,
                fit: BoxFit
                    .cover, // Ensures the image fits within the dimensions
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                              (loadingProgress.expectedTotalBytes ?? 1)
                          : null,
                    ),
                  );
                },
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: 100,
                    height: 100,
                    color:
                        Colors.grey[400], // Fallback color in case of an error
                    child: Icon(
                      Icons.broken_image,
                      color: Colors.white,
                    ),
                  );
                },
              ),
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
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Audiowide",
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  "Date: $date",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontFamily: "Audiowide",
                  ),
                ),
                Text(
                  "Time: $time",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontFamily: "Audiowide",
                  ),
                ),
                Text(
                  "Venue: $venue",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontFamily: "Audiowide",
                  ),
                ),
                Text(
                  "Description: $description",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 10,
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
