import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ThemeController extends GetxController {
  final isDarkMode = false.obs;
  final themeBox = Hive.box('themeBox');

  @override
  void onInit() {
    super.onInit();
    _loadThemeFromBox();
  }

  _loadThemeFromBox() {
    if (themeBox.get('theme') != null) {
      isDarkMode.value = themeBox.get('theme');
    }
  }

  void toggleTheme() {
    Get.changeThemeMode(isDarkMode.value ? ThemeMode.light : ThemeMode.dark);
    isDarkMode.value = !isDarkMode.value;
    themeBox.put('theme', isDarkMode.value);
  }
}
