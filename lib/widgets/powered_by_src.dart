import 'package:flutter/material.dart';

class PoweredBySrc extends StatelessWidget {
  final String logoAssetPath;
  final String text;
  final double logoSize;
  final TextStyle textStyle;

  const PoweredBySrc({
    super.key,
    required this.logoAssetPath,
    required this.text,
    this.logoSize = 40.0,
    this.textStyle = const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      fontFamily: "Audiowide",
    ),
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: logoSize / 2,
            backgroundImage: AssetImage(logoAssetPath),
          ),
          SizedBox(width: 16),
          Text(text, style: textStyle),
        ],
      ),
    );
  }
}
