import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeModeButton extends StatelessWidget {
  const ThemeModeButton({super.key}); // Add Key parameter

  @override
  Widget build(BuildContext context) {
    final box = GetStorage(); // Initialize GetStorage

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(50),
      ),
      child: SizedBox(
        width: 40, // Fixed width to ensure consistent size
        height: 40, // Fixed height to ensure consistent size
        child: IconButton(
          onPressed: () {
            final val = box.read("theme");
            if (val == null || val == "dark") {
              box.write("theme", "light");
              Get.changeThemeMode(ThemeMode.light);
            } else {
              box.write("theme", "dark");
              Get.changeThemeMode(ThemeMode.dark);
            }
          },
          icon: const Icon(Icons.dark_mode),
        ),
      ),
    );
  }
}
