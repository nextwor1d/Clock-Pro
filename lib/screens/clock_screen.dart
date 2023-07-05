// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icons_plus/icons_plus.dart';
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
  DateTime washingtonT = DateTime.now();
  DateTime londonT = DateTime.now();
  DateTime parisT = DateTime.now();

  void getTimeIn() {
    DateTime now = DateTime.now().toUtc();

    // Load the 'America/New_York' timezone
    tz.Location washington = tz.getLocation('America/New_York');
    // Convert the UTC time to Washington time
    tz.TZDateTime washingtonTime = tz.TZDateTime.from(now, washington);
    washingtonT = washingtonTime;

    tz.Location london = tz.getLocation('Europe/London');
    tz.TZDateTime londonTime = tz.TZDateTime.from(now, london);
    londonT = londonTime;

    tz.Location paris = tz.getLocation('Europe/Paris');
    tz.TZDateTime parisTime = tz.TZDateTime.from(now, paris);
    parisT = parisTime;
  }

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _datTime = DateTime.now();
        getTimeIn();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    List countryList = [
      // name, Time difference, flag, time
      [
        'United States',
        'UTC 5:00',
        Flag(Flags.united_states_of_america, size: 45),
        '${washingtonT.hour}:${washingtonT.minute}',
      ],
      [
        'London',
        'UTC 1:00',
        Flag(Flags.england, size: 45),
        '${londonT.hour}:${londonT.minute}',
      ],
      [
        'Paris',
        'UTC 2:00',
        Flag(Flags.france, size: 45),
        '${parisT.hour}:${parisT.minute}',
      ],
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
            itemCount: countryList.length,
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
