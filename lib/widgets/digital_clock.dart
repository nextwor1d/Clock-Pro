// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class DigitalClock extends StatefulWidget {
  const DigitalClock({
    super.key,
  });

  @override
  State<DigitalClock> createState() => _DigitalClockState();
}

class _DigitalClockState extends State<DigitalClock> {
  TimeOfDay _timeOfDay = TimeOfDay.now();

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_timeOfDay.minute != TimeOfDay.now().minute) {
          _timeOfDay = TimeOfDay.now();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    String period = _timeOfDay.period == DayPeriod.am ? 'AM' : 'PM';
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Time
        Text(
          '${_timeOfDay.hourOfPeriod}:${_timeOfDay.minute}',
          style: GoogleFonts.lato(
              textStyle: Theme.of(context).textTheme.displayMedium),
        ).marginOnly(right: 5),

        // pm/am
        RotatedBox(
          quarterTurns: 3,
          child: Text(
            period,
            style: GoogleFonts.lato(
              textStyle: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
        ),
      ],
    );
  }
}
