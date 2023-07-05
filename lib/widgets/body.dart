// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/country_cards.dart';
import '../widgets/digital_clock.dart';
import 'clock_painter.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  DateTime _datTime = DateTime.now();

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _datTime = DateTime.now();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // TimeZone
        Text(
          'Time Zone',
          style: GoogleFonts.lato(
            textStyle: Theme.of(context).textTheme.bodyLarge,
          ),
        ),

        // DigitalClock
        DigitalClock(),

        // Analog Clock
        Container(
          margin: EdgeInsets.only(bottom: 15, top: 10),
          height: width / 1.5,
          width: width / 1.5,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Theme.of(context).primaryColor,
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 10,
              ),
            ],
          ),
          child: Transform.rotate(
            angle: -pi / 2,
            child: CustomPaint(
              painter: ClockPainter(context, _datTime),
            ),
          ),
        ),

        // CountryCards
        Expanded(
          child: GridView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 4,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              childAspectRatio: 2 / 3,
            ),
            itemBuilder: (context, index) {
              return CountryCards();
            },
          ).marginOnly(left: 10),
        ),
      ],
    );
  }
}
