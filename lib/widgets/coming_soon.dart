import 'package:abhiyanth/services/size_config.dart';
import 'package:flutter/material.dart';

class ComingSoonWidget extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Color textColor;

  const ComingSoonWidget({
    Key? key,
    required this.text,
    this.backgroundColor = Colors.grey,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // const Icon(
          //   Icons.hourglass_empty,
          //   size: 50,
          //   color: Colors.white,
          // ),
          // const SizedBox(height: 16),
          Text(
            text,
            style: TextStyle(
              fontSize: SizeConfig.safeBlockVertical*2,
              fontWeight: FontWeight.bold,
              color: textColor,
              fontFamily: "Audiowide",
            ),
          ),
          const SizedBox(height: 8),
          // Text(
          //   text,
          //   textAlign: TextAlign.center,
          //   style: TextStyle(
          //     fontSize: 16,
          //     color: textColor.withOpacity(0.8),
          //   ),
          // ),
        ],
      ),
    );
  }
}
