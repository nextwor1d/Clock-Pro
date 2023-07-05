// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

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

    // hour line
    canvas.drawLine(
        center,
        Offset(100, 180),
        Paint()
          ..color = Colors.grey
          ..style = PaintingStyle.stroke
          ..strokeWidth = 5);

    // minutes line
    canvas.drawLine(
        center,
        Offset(60, 170),
        Paint()
          ..color = Colors.grey
          ..style = PaintingStyle.stroke
          ..strokeWidth = 3);

    // seconds line
    canvas.drawLine(
        center,
        Offset(30, 150),
        Paint()
          ..color = Colors.grey
          ..style = PaintingStyle.stroke
          ..strokeWidth = 1.5);

    // second calculation
    double secondX = centerY;
    double secondY = centerY;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
