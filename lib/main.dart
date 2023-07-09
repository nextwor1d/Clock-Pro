// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:clock_pro/models/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'models/theme_data.dart';
import 'screens/home.dart';
import 'package:timezone/data/latest.dart' as tz;

void main() async {
  tz.initializeTimeZones();
  await Hive.initFlutter();
  await Hive.openBox('themeBox');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final ThemeController controller = Get.put(ThemeController());
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: controller.isDarkMode.value ? ThemeMode.dark : ThemeMode.light,
      theme: themeData(context),
      darkTheme: darkThemeData(context),
      home: HomeScreen(),
    );
  }
}
