import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:quran/controllers/home_controller.dart';

class LangService extends GetxService {
  static final box = GetStorage(); // Initialize GetStorage

  static void changeLang() {
    if (Get.locale == null || Get.locale!.languageCode.contains("en")) {
      box.write("locale", "ar");
      Get.updateLocale(const Locale("ar"));
    } else if (Get.locale!.languageCode == "ar") {
      box.write("locale", "en");
      Get.updateLocale(const Locale("en"));
    }
    Get.find<HomeController>().getSuwar();
  }

  static String getLang() {
    String lang = box.read("locale") ?? "en";
    if (lang == "ar") {
      return "Arbic";
    } else {
      return "English";
    }
  }
}
