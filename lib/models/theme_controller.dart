import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ThemeController extends GetxController {
  final isDarkMode = false.obs;
  final themeBox = Hive.box('themeBox'); // Reference to the Hive box

  @override
  void onInit() {
    super.onInit();
    _loadThemeFromBox(); // Load the saved theme mode from Hive
  }

  void _loadThemeFromBox() {
    final savedTheme = themeBox.get('theme'); // Retrieve the saved theme mode
    if (savedTheme != null) {
      isDarkMode.value = savedTheme; // Update the isDarkMode value
    }
  }

  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
    Get.changeThemeMode(isDarkMode.value ? ThemeMode.dark : ThemeMode.light);
    themeBox.put(
        'theme', isDarkMode.value); // Save the updated theme mode to Hive
  }
}
