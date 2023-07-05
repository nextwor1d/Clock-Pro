// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icons_plus/icons_plus.dart';

class CountryCards extends StatelessWidget {
  const CountryCards({
    super.key,
  });

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
          // Country
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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

          // Flag / Time
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
                    '6:20',
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
