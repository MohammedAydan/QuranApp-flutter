import 'package:get/get.dart';
import 'package:quran/views/downloads_screen/downloads_screen.dart';
import 'package:quran/views/home_screen/home_screen.dart';

List<GetPage> getPages = [
  GetPage(
    name: HomeScreen.routeName,
    page: () => const HomeScreen(),
  ),
  GetPage(
    name: DownloadsScreen.routeName,
    page: () => DownloadsScreen(),
  ),
];
