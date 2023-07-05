// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:math';
import 'package:flutter/material.dart';

class ClockPainter extends CustomPainter {
  final BuildContext context;
  DateTime dateTime;
  ClockPainter(this.context, this.dateTime);

  @override
  void paint(Canvas canvas, Size size) {
    double centerX = size.width / 2;
    double centerY = size.height / 2;
    Offset center = Offset(centerX, centerY);

    // circle
    canvas.drawCircle(center, 7, Paint()..color = Colors.grey);

    // hour calculation
    double hourX = centerX +
        size.width *
            0.24 *
            cos((dateTime.hour * 30 + dateTime.minute * 0.5) * pi / 180);
    double hourY = centerY +
        size.width *
            0.24 *
            sin((dateTime.hour * 30 + dateTime.minute * 0.5) * pi / 180);

    // hour line
    canvas.drawLine(
        center,
        Offset(hourX, hourY),
        Paint()
          ..color = Colors.grey
          ..style = PaintingStyle.stroke
          ..strokeWidth = 6);

    // minute calculation
    double minX =
        centerX + size.width * 0.34 * cos((dateTime.minute * 6) * pi / 180);
    double minY =
        centerY + size.width * 0.34 * sin((dateTime.minute * 6) * pi / 180);

    // minutes line
    canvas.drawLine(
        center,
        Offset(minX, minY),
        Paint()
          ..color = Colors.grey
          ..style = PaintingStyle.stroke
          ..strokeWidth = 4);

    // second calculation
    double secondX =
        centerX + size.width * 0.4 * cos((dateTime.second * 6) * pi / 180);
    double secondY =
        centerY + size.width * 0.4 * sin((dateTime.second * 6) * pi / 180);

    // seconds line
    canvas.drawLine(
        center,
        Offset(secondX, secondY),
        Paint()
          ..color = Colors.grey
          ..style = PaintingStyle.stroke
          ..strokeWidth = 1.5);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
