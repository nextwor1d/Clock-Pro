// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData themeData(BuildContext context) {
  return ThemeData(
    textTheme: GoogleFonts.latoTextTheme().copyWith(
      bodySmall: GoogleFonts.lato(color: Colors.grey),
      bodyMedium: GoogleFonts.lato(color: Colors.grey),
      bodyLarge: GoogleFonts.lato(color: Colors.grey),
      displaySmall:
          GoogleFonts.lato(color: Colors.black, fontWeight: FontWeight.w300),
      displayMedium: GoogleFonts.lato(
          fontSize: 70, color: Colors.black, fontWeight: FontWeight.w300),
      titleLarge: GoogleFonts.lato(color: Colors.black),
    ),
    primaryColor: Colors.white,
  );
}

ThemeData darkThemeData(BuildContext context) {
  return ThemeData.dark().copyWith(
    textTheme: GoogleFonts.latoTextTheme().copyWith(
      bodySmall: GoogleFonts.lato(color: Colors.grey),
      bodyMedium: GoogleFonts.lato(color: Colors.grey),
      bodyLarge: GoogleFonts.lato(color: Colors.grey),
      displaySmall:
          GoogleFonts.lato(color: Colors.white, fontWeight: FontWeight.w300),
      displayMedium: GoogleFonts.lato(
          fontSize: 70, color: Colors.white, fontWeight: FontWeight.w300),
      titleLarge: GoogleFonts.lato(color: Colors.white),
    ),
    primaryColor: Colors.white10,
  );
}
