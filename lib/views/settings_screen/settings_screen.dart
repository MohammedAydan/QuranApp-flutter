import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran/services/lang_service.dart';
import 'package:quran/services/theme_service.dart';
import 'package:quran/views/about_screen/about_screen.dart';
import 'package:quran/views/privacy_policy_screen/privacy_policy_screen.dart';

class SettingsScreen extends StatelessWidget {
  static const String routeName = "/Settings";
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings".tr),
        centerTitle: true,
      ),
      body: Column(
        children: [
          ListTile(
            title: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.language),
                const SizedBox(width: 10),
                Text("Language".tr),
              ],
            ),
            trailing: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Theme.of(context).colorScheme.secondary.withOpacity(0.5),
              ),
              child: Text(LangService.getLang().tr),
            ),
            onTap: () => LangService.changeLang(),
          ),
          ListTile(
            title: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.color_lens),
                const SizedBox(width: 10),
                Text("Theme".tr),
              ],
            ),
            trailing: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Theme.of(context).colorScheme.secondary.withOpacity(0.5),
              ),
              child: Text(ThemeService.getThemeMode().tr),
            ),
            onTap: () => ThemeService.changeTheme(),
          ),
          ListTile(
            title: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.privacy_tip),
                const SizedBox(width: 10),
                Text("Privacy policy".tr),
              ],
            ),
            // trailing: const Icon(Icons.info_outline),
            onTap: () {
              // Get.toNamed(AboutScreen.routeName);
              Get.toNamed(PrivacyPolicyScreen.routeName);
            },
          ),
          ListTile(
            title: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.info),
                const SizedBox(width: 10),
                Text("About".tr),
              ],
            ),
            // trailing: const Icon(Icons.info_outline),
            onTap: () {
              // Get.toNamed(AboutScreen.routeName);
              Get.toNamed(AboutScreen.routeName);
            },
          ),
          const Spacer(),
          Center(
            child: Text(
              "powered_by".tr,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
