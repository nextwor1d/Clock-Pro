// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:clock_pro/screens/timer_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/theme_controller.dart';
import 'clock_screen.dart';

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
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Builder(
          builder: (BuildContext context) => IconButton(
            icon: Icon(
              Icons.tune,
              color: Colors.grey,
            ),
            iconSize: 30,
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
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
      // Drawer
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.transparent,
              ),
              child: Image.asset(
                'assets/nextwor1d.png',
                height: 180,
              ),
            ),
            ListTile(
              leading: Icon(Bootstrap.github, size: 35),
              trailing: Icon(Icons.open_in_new),
              title: Text('nextwor1d',
                  style: Theme.of(context).textTheme.titleLarge),
              onTap: () => launchUrl(Uri.parse('https://github.com/nextwor1d'),
                  mode: LaunchMode.externalApplication),
            ),
            Divider(),
            ListTile(
              leading: Icon(Bootstrap.telegram, size: 35),
              trailing: Icon(Icons.open_in_new),
              title: Text('Flutter_Ninja',
                  style: Theme.of(context).textTheme.titleLarge),
              onTap: () => launchUrl(Uri.parse('https://t.me/flutter_ninja'),
                  mode: LaunchMode.externalApplication),
            ),
            Divider(),
            ListTile(
              leading: Icon(Bootstrap.instagram, size: 35),
              trailing: Icon(Icons.open_in_new),
              title: Text('Flutter_Hero',
                  style: Theme.of(context).textTheme.titleLarge),
              onTap: () => launchUrl(
                  Uri.parse('https://instagram.com/flutter_hero'),
                  mode: LaunchMode.externalApplication),
            ),
            Divider(),
            Text(
              'Contact Me',
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
      // Body
      body: IndexedStack(
        index: _currentIndex,
        children: [
          Body(),
          TimerScreen(),
        ],
      ),
      // bottomNavigationBar
      bottomNavigationBar: GNav(
        mainAxisAlignment: MainAxisAlignment.center,
        iconSize: 30,
        textStyle: Theme.of(context).textTheme.bodyLarge,
        tabs: [
          GButton(
            icon: Icons.watch_later_outlined,
            text: 'Clock',
            gap: 5,
          ),
          GButton(
            icon: Icons.timer_outlined,
            text: 'Timer',
            gap: 5,
          ),
        ],
        selectedIndex: _currentIndex,
        onTabChange: (value) => setState(() => _currentIndex = value),
      ),
    );
  }
}
