import 'package:flutter/material.dart';
import 'dart:ui';
import 'dart:async';
import 'dart:math';

class Squares extends StatefulWidget {
  final String direction;
  final double speed;
  final Color borderColor;
  final double squareSize;
  final Color hoverFillColor;

  const Squares({
    super.key,
    this.direction = 'right',
    this.speed = 1.0,
    this.borderColor = const Color(0xFF999999),
    this.squareSize = 40.0,
    this.hoverFillColor = const Color(0xFF222222),
  });

  @override
  _SquaresState createState() => _SquaresState();
}

class _SquaresState extends State<Squares> with SingleTickerProviderStateMixin {
  late double gridOffsetX;
  late double gridOffsetY;
  Offset? hoveredSquare;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    gridOffsetX = 0.0;
    gridOffsetY = 0.0;
    _startAnimation();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _startAnimation() {
    _timer = Timer.periodic(const Duration(milliseconds: 16), (_) {
      setState(() {
        double effectiveSpeed = widget.speed.clamp(0.1, double.infinity);

        switch (widget.direction) {
          case 'right':
            gridOffsetX = (gridOffsetX - effectiveSpeed) % widget.squareSize;
            break;
          case 'left':
            gridOffsetX = (gridOffsetX + effectiveSpeed) % widget.squareSize;
            break;
          case 'up':
            gridOffsetY = (gridOffsetY + effectiveSpeed) % widget.squareSize;
            break;
          case 'down':
            gridOffsetY = (gridOffsetY - effectiveSpeed) % widget.squareSize;
            break;
          case 'diagonal':
            gridOffsetX = (gridOffsetX - effectiveSpeed) % widget.squareSize;
            gridOffsetY = (gridOffsetY - effectiveSpeed) % widget.squareSize;
            break;
        }
      });
    });
  }

  void _handleHover(Offset position, Size size) {
    setState(() {
      double gridX = (position.dx + gridOffsetX) / widget.squareSize;
      double gridY = (position.dy + gridOffsetY) / widget.squareSize;

      hoveredSquare = Offset(gridX.floorToDouble(), gridY.floorToDouble());
    });
  }

  void _handleHoverExit() {
    setState(() {
      hoveredSquare = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (details) =>
          _handleHover(details.localPosition, MediaQuery.of(context).size),
      onPanEnd: (_) => _handleHoverExit(),
      child: CustomPaint(
        size: Size.infinite,
        painter: SquaresPainter(
          gridOffsetX: gridOffsetX,
          gridOffsetY: gridOffsetY,
          squareSize: widget.squareSize,
          borderColor: widget.borderColor,
          hoverFillColor: widget.hoverFillColor,
          hoveredSquare: hoveredSquare,
        ),
      ),
    );
  }
}

class SquaresPainter extends CustomPainter {
  final double gridOffsetX;
  final double gridOffsetY;
  final double squareSize;
  final Color borderColor;
  final Color hoverFillColor;
  final Offset? hoveredSquare;

  SquaresPainter({
    required this.gridOffsetX,
    required this.gridOffsetY,
    required this.squareSize,
    required this.borderColor,
    required this.hoverFillColor,
    this.hoveredSquare,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint borderPaint = Paint()
      ..color = borderColor
      ..style = PaintingStyle.stroke;

    final Paint fillPaint = Paint()..color = hoverFillColor;

    double startX = (gridOffsetX / squareSize).floor() * squareSize - gridOffsetX;
    double startY = (gridOffsetY / squareSize).floor() * squareSize - gridOffsetY;

    for (double x = startX; x < size.width; x += squareSize) {
      for (double y = startY; y < size.height; y += squareSize) {
        if (hoveredSquare != null &&
            (x / squareSize).floor() == hoveredSquare!.dx &&
            (y / squareSize).floor() == hoveredSquare!.dy) {
          canvas.drawRect(Rect.fromLTWH(x, y, squareSize, squareSize), fillPaint);
        }
        canvas.drawRect(Rect.fromLTWH(x, y, squareSize, squareSize), borderPaint);
      }
    }

    final double centerX = size.width / 2;
    final double centerY = size.height / 2;
    final double maxRadius = sqrt(size.width * size.width + size.height * size.height) / 2;

    final Paint gradientPaint = Paint()
      ..shader = RadialGradient(
        colors: [Colors.transparent, Colors.black],
        stops: [0.0, 1.0],
      ).createShader(Rect.fromCircle(center: Offset(centerX, centerY), radius: maxRadius));

    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.width, size.height),
      gradientPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
