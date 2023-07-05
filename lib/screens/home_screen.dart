// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import '../models/theme_controller.dart';
import '../widgets/body.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ThemeController _themeController = Get.put(ThemeController());
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(
            Icons.tune,
            color: Colors.grey,
            size: 30,
          ),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: _themeController.isDarkMode.value
                ? Icon(Icons.dark_mode_outlined)
                : Icon(
                    Icons.sunny,
                    color: Colors.black,
                  ),
            onPressed: () => _themeController.toggleTheme(),
          ),
        ],
      ),
      // Body
      body: Body(),
      // bottomNavigationBar
      bottomNavigationBar: GNav(
        mainAxisAlignment: MainAxisAlignment.center,
        iconSize: 30,
        textStyle: Theme.of(context).textTheme.bodyLarge,
        tabs: [
          GButton(
            icon: Icons.access_time,
            gap: 5,
            text: 'Clock',
          ),
          GButton(
            icon: Icons.language_rounded,
            text: 'World',
            gap: 5,
          ),
          GButton(
            icon: Icons.alarm,
            text: 'Alarm',
            gap: 5,
          ),
          GButton(
            icon: Icons.timer_outlined,
            text: 'Timer',
            gap: 5,
          ),
        ],
        selectedIndex: _currentIndex,
        onTabChange: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
      ),
    );
  }
}
