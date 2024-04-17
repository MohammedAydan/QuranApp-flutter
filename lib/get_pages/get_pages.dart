import 'package:get/get.dart';
import 'package:quran/views/about_screen/about_screen.dart';
import 'package:quran/views/downloads_screen/downloads_screen.dart';
import 'package:quran/views/home_screen/home_screen.dart';
import 'package:quran/views/privacy_policy_screen/privacy_policy_screen.dart';
import 'package:quran/views/settings_screen/settings_screen.dart';

List<GetPage> getPages = [
  GetPage(
    name: HomeScreen.routeName,
    page: () => const HomeScreen(),
  ),
  GetPage(
    name: DownloadsScreen.routeName,
    page: () => DownloadsScreen(),
  ),
  GetPage(
    name: SettingsScreen.routeName,
    page: () => const SettingsScreen(),
  ),
  GetPage(
    name: PrivacyPolicyScreen.routeName,
    page: () => const PrivacyPolicyScreen(),
  ),
   GetPage(
    name: AboutScreen.routeName,
    page: () => const AboutScreen(),
  ),
];
