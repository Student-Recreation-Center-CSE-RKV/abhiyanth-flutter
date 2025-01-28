import 'package:flutter/material.dart';

class NotificationDialog extends StatelessWidget {
  final Map<String, dynamic> notification;

  const NotificationDialog({Key? key, required this.notification})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 0,
      shadowColor: Colors.white,
      backgroundColor: Colors.transparent, // Make background transparent for border visibility
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black, // Background color of the card
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: Colors.white38, // Border color
            width: 2, // Border width
          ),
        ),
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    notification['title'] ?? 'No Title',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(
                    Icons.close,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            if (notification['sub_title'] != null && notification['sub_title']!.isNotEmpty) ...[
              const SizedBox(height: 8),
              Text(
                notification['sub_title']!,
                style: const TextStyle(
                  fontSize: 16,
                  fontStyle: FontStyle.italic,
                  color: Colors.white54,
                ),
              ),
            ],
            const SizedBox(height: 8),
            Text(
              notification['description'] ?? 'No Description',
              style: const TextStyle(fontSize: 14, color: Colors.white),
            ),
            const SizedBox(height: 16),
            if (notification['image'] != null && notification['image']!.isNotEmpty) ...[
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  notification['image']!,
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 16),
            ],
          ],
        ),
      ),
    );
  }
}
