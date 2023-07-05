// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icons_plus/icons_plus.dart';

class CountryCards extends StatelessWidget {
  final String name;
  final String utc;
  final Flag flag;
  final String time;

  const CountryCards(
      {super.key,
      required this.name,
      required this.time,
      required this.utc,
      required this.flag});

  @override
  Widget build(BuildContext context) {
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
                name,
                style: GoogleFonts.lato(
                    textStyle: Theme.of(context).textTheme.titleLarge),
              ),
              Text(
                utc,
                style: GoogleFonts.lato(
                    textStyle: Theme.of(context).textTheme.bodyMedium),
              ).marginOnly(top: 5),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Flag
              flag,

              // Time
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    time,
                    style: GoogleFonts.lato(
                        textStyle: Theme.of(context).textTheme.displaySmall),
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
