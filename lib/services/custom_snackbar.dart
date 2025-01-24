import 'package:flutter/material.dart';

class CustomSnackBar {
  static void show(BuildContext context, String message, {String type = "success"}) {
    // Determine text color and icon based on the type of message
    Color textColor;
    IconData icon;
    switch (type) {
      case "error":
        textColor = Colors.red;
        icon = Icons.error;
        break;
      case "warning":
        textColor = Colors.orange;
        icon = Icons.warning;
        break;
      case "success":
      default:
        textColor = Colors.green;
        icon = Icons.check_circle;
        break;
    }

    final snackBar = SnackBar(
      content: Row(
        children: [
          Icon(
            icon,
            color: textColor,
          ),
          const SizedBox(width: 8), // Spacing between icon and message
          Expanded(
            child: Text(
              message,
              style: TextStyle(
                color: textColor,
                fontWeight: FontWeight.bold,
                fontFamily: "Audiowide",
                fontSize: 16,
              ),
            ),
          ),
          IconButton(
            icon: const Icon(
              Icons.close,
              color: Colors.white,
            ),
            onPressed: () {
              ScaffoldMessenger.of(context).hideCurrentSnackBar(); // Dismiss Snackbar
            },
          ),
        ],
      ),
      backgroundColor: Colors.black87, // Background for better contrast
      behavior: SnackBarBehavior.floating,
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      duration: const Duration(seconds: 3),
      animation: CurvedAnimation(
        parent: AlwaysStoppedAnimation(0), // Minimal animation
        curve: Curves.easeInOut,
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
