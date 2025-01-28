import 'dart:convert';

import 'package:timeago/timeago.dart' as timeago;
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class NotificationItem extends StatelessWidget {
  final Map<String, dynamic> notification;

  const NotificationItem({super.key, required this.notification});

  @override
  Widget build(BuildContext context) {
    // Parse the notification time
    final notificationTime = (notification['time'] as Timestamp).toDate();
  print(DateTime.parse(notification['time']));
    // Check if the time is a Firestore Timestamp
    // if (notification['time') {
    //   notificationTime = notification['time'].toDate(); // Convert to DateTime
    // } else {
    //   notificationTime = DateTime.now();
    // }

    // Format the notification time using timeago

    // final timeAgo = timeago.format(notification['time']);

    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      color: Colors.transparent, // Transparent for glassy effect
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.1), // Semi-transparent white
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Colors.white.withOpacity(0.2), 
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            if (notification['image'] != null && notification['image'].isNotEmpty)
              Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      notification['image'],
                      height: 60,
                      width: 60,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    timeago.format(notificationTime),
                    style: const TextStyle(
                      fontSize: 10,
                      fontStyle: FontStyle.italic,
                      color: Colors.grey,
                      fontFamily: "Audiowide",
                    ),
                  ),
                ],
              ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    notification['title'] ?? 'No Title',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    notification['description'] ?? 'No description available',
                    style: const TextStyle(
                      fontSize: 12,
                      fontFamily: "Audiowide",
                      color: Colors.white70,
                    ),
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
