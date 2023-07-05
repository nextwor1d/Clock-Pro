// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/country_cards.dart';
import '../widgets/digital_clock.dart';
import '../widgets/clock_painter.dart';
import 'package:timezone/timezone.dart' as tz;

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  DateTime _datTime = DateTime.now();
  DateTime countryTime = DateTime.now();

  void getTimeInWashington() {
    // Get the current UTC time
    DateTime now = DateTime.now().toUtc();

    // Load the 'America/New_York' timezone
    tz.Location washington = tz.getLocation('America/New_York');

    // Convert the UTC time to Washington time
    tz.TZDateTime washingtonTime = tz.TZDateTime.from(now, washington);

    countryTime = washingtonTime;
  }

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _datTime = DateTime.now();
        getTimeInWashington();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    List countryList = [
      // name, Time difference, flag, time
      ['NewYork City', 'UTC−05:00','Flags.united_states_of_america' , '${countryTime.hour}:${countryTime.minute}']
    ];
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
            itemCount: 1,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              childAspectRatio: 2 / 3,
            ),
            itemBuilder: (context, index) {
              return CountryCards(
                name: countryList[index][0],
                utc: countryList[index][1],
                flag: countryList[index][2],
                time: countryList[index][3],
              );
            },
          ).marginOnly(left: 10),
        ),
      ],
    );
  }
}
