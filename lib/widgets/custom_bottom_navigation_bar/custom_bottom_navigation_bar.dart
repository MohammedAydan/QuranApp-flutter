import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran/controllers/home_controller.dart';
import 'package:quran/views/downloads_screen/downloads_screen.dart';
import '../control_play_audio/control_play_audio.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({
    super.key,
    required this.controller,
  });

  final HomeController controller;
  final bool showBottonNavBar = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (controller.selectedSura != null) ...[
          ControlPlayAudio(controller: controller),
        ],
        if (showBottonNavBar) ...[
          Container(
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(width: 1, color: context.theme.primaryColor),
              ),
            ),
            child: BottomNavigationBar(
              elevation: 0,
              onTap: (v) {
                if (v == 0) {
                  // Get.toNamed(HomeScreen.routeName);
                } else if (v == 1) {
                  Get.toNamed(DownloadsScreen.routeName);
                } else {
                  // Get.toNamed(SettingsScreen.routeName);
                }
              },
              items: [
                BottomNavigationBarItem(
                  icon: const Icon(Icons.home),
                  label: "Home".tr,
                ),
                BottomNavigationBarItem(
                  icon: const Icon(Icons.download_for_offline),
                  label: "Downloads".tr,
                ),
                BottomNavigationBarItem(
                  icon: const Icon(Icons.settings),
                  label: "Settings".tr,
                ),
              ],
            ),
          ),
        ],
      ],
    );
  }
}
