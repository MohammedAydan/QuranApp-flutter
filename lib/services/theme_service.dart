import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeService extends GetxService {
  static final box = GetStorage(); // Initialize GetStorage

  static void changeTheme() {
    final val = box.read("theme");
    if (val == null || val == "dark") {
      box.write("theme", "light");
      Get.changeThemeMode(ThemeMode.light);
    } else {
      box.write("theme", "dark");
      Get.changeThemeMode(ThemeMode.dark);
    }
  }

  static String getThemeMode() {
    final theme = box.read("theme") ?? "dark";
    if (theme == "dark") {
      return "Dark";
    } else {
      return "Light";
    }
  }
}
