import 'dart:async';
import 'package:abhiyanth/services/size_config.dart';
import 'package:flutter/material.dart';

class ComingSoonWidget extends StatefulWidget {
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
  _ComingSoonWidgetState createState() => _ComingSoonWidgetState();
}

class _ComingSoonWidgetState extends State<ComingSoonWidget> {
  late Duration remainingTime;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    _calculateRemainingTime();
    timer = Timer.periodic(const Duration(seconds: 1), (_) => _updateTimer());
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  void _calculateRemainingTime() {
    final now = DateTime.now();
    final targetDate = DateTime(2025, 2, 27, 0, 0); // February 27, 2025, 12:00 AM
    remainingTime = targetDate.difference(now); // Calculate the difference
  }


  void _updateTimer() {
    setState(() {
      _calculateRemainingTime();
    });
  }

  @override
  Widget build(BuildContext context) {
    final days = remainingTime.inDays;
    final hours = remainingTime.inHours % 24;
    final minutes = remainingTime.inMinutes % 60;
    final seconds = remainingTime.inSeconds % 60;

    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: widget.backgroundColor,
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
          Text(
            widget.text,
            style: TextStyle(
              fontSize: SizeConfig.safeBlockVertical * 2.5,
              fontWeight: FontWeight.bold,
              color: widget.textColor,
              fontFamily: "Audiowide",
            ),
          ),
          const SizedBox(height: 16),
          Text(
            "${days}d ${hours}h ${minutes}m ${seconds}s",
            style: TextStyle(
              fontSize: SizeConfig.safeBlockVertical * 2,
              fontWeight: FontWeight.bold,
              color: widget.textColor,
              fontFamily: "Audiowide",
            ),
          ),
        ],
      ),
    );
  }
}
