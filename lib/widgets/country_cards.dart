// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:intl/intl.dart';

class CountryCards extends StatefulWidget {
  const CountryCards({
    super.key,
  });

  @override
  State<CountryCards> createState() => _CountryCardsState();
}

class _CountryCardsState extends State<CountryCards> {
  DateTime now = DateTime.now();
  String timeZone = 'America/New_York';

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 1), (timer) {});
  }

  @override
  Widget build(BuildContext context) {
    DateTime americanTime = now
        .toLocal()
        .add(
          Duration(
              seconds: DateTime.parse(now.toString()).timeZoneOffset.inSeconds),
        )
        .add(
          Duration(
              hours: DateTime.parse(now.toString()).timeZoneOffset.isNegative
                  ? -5
                  : -4),
        );
    String formattedTime = DateFormat.jm().format(americanTime);

    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
      elevation: 5,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // country
              Text(
                'NewYork City',
                style: GoogleFonts.lato(
                    textStyle: Theme.of(context).textTheme.titleLarge),
              ),
              Text(
                '+3 HRS',
                style: GoogleFonts.lato(
                    textStyle: Theme.of(context).textTheme.bodyMedium),
              ).marginOnly(top: 5),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Flag
              Flag(
                Flags.united_states_of_america,
                size: 40,
              ),

              // Time
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    formattedTime,
                    style: GoogleFonts.lato(
                        textStyle: Theme.of(context).textTheme.displaySmall),
                  ).marginOnly(right: 5),

                  // period
                  RotatedBox(
                    quarterTurns: 3,
                    child: Text(
                      'PM',
                      style: GoogleFonts.lato(
                        textStyle: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ).paddingAll(12),
    ).marginOnly(right: 10);
  }
}
