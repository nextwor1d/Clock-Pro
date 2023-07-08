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
  Timer? _timer;
  DateTime _datTime = DateTime.now();
  DateTime washingtonT = DateTime.now();
  DateTime londonT = DateTime.now();
  DateTime parisT = DateTime.now();
  DateTime frankfurtT = DateTime.now();
  DateTime chinaT = DateTime.now();
  DateTime japanT = DateTime.now();

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

    tz.Location frankfurt = tz.getLocation('Europe/Berlin');
    tz.TZDateTime frankfurtTime = tz.TZDateTime.from(now, frankfurt);
    frankfurtT = frankfurtTime;

    tz.Location china = tz.getLocation('Asia/Shanghai');
    tz.TZDateTime chinaTime = tz.TZDateTime.from(now, china);
    chinaT = chinaTime;

    tz.Location japan = tz.getLocation('Asia/Tokyo');
    tz.TZDateTime japanTime = tz.TZDateTime.from(now, japan);
    japanT = japanTime;
  }

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _datTime = DateTime.now();
        getTimeIn();
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List countryList = [
      // name, Time difference, flag, time
      [
        'United States',
        'UTC -4',
        Flag(Flags.united_states_of_america, size: 45),
        '${washingtonT.hour}:${washingtonT.minute}',
      ],
      [
        'England',
        'UTC +1',
        Flag(Flags.england, size: 45),
        '${londonT.hour}:${londonT.minute}',
      ],
      [
        'Germany',
        'UTC +8',
        Flag(Flags.germany, size: 45),
        '${frankfurtT.hour}:${frankfurtT.minute}',
      ],
      [
        'China',
        'UTC +8',
        Flag(Flags.china, size: 45),
        '${chinaT.hour}:${chinaT.minute}',
      ],
      [
        'Japan',
        'UTC +9',
        Flag(Flags.japan, size: 45),
        '${japanT.hour}:${japanT.minute}',
      ],
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Current Time
        Text(
          'Current Time Zone',
          style: GoogleFonts.lato(
            textStyle: Theme.of(context).textTheme.bodyLarge,
          ),
        ),

        // DigitalClock
        DigitalClock(),

        // Analog Clock
        Expanded(
          flex: 7,
          child: AspectRatio(
            aspectRatio: 1,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 30),
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
          ),
        ),

        // CountryCards
        Expanded(
          flex: 3,
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
