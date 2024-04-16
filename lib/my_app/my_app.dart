import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:quran/get_pages/get_pages.dart';
import 'package:quran/my_app/binding.dart';
import 'package:quran/services/translations/translation.dart';
import 'package:quran/themes/dark_theme.dart';
import 'package:quran/themes/default_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: BindingsForInit(),
      key: key,
      title: "Quran app",
      debugShowCheckedModeBanner: false,
      getPages: getPages,
      initialRoute: "/Home",
      themeMode: getThemeMode(),
      theme: defaultTheme,
      darkTheme: darkTheme,
      translations: Translation(),
      locale: getLocale(),
    );
  }

  String getTheme() {
    var box = GetStorage();
    var theme = box.read("theme");
    return theme ?? "light";
  }

  ThemeMode getThemeMode() {
    var theme = getTheme();
    if (theme == "dark") {
      return ThemeMode.dark;
    } else {
      return ThemeMode.light;
    }
  }

  String getLocaleStorage() {
    var box = GetStorage();
    var locale = box.read("locale");
    return locale ?? "en";
  }

  Locale getLocale() {
    var locale = getLocaleStorage();
    if (locale == "ar") {
      return const Locale("ar");
    } else {
      return const Locale("en");
    }
  }
}
