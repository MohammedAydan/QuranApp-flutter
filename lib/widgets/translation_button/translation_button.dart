import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:quran/controllers/home_controller.dart';

class TranslationButton extends StatelessWidget {
  const TranslationButton({super.key}); // Use Key? key

  @override
  Widget build(BuildContext context) {
    final box = GetStorage(); // Initialize GetStorage

    return Container(
      width: 40,
      height: 40,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(50),
      ),
      child: IconButton(
        onPressed: () {
          if (Get.locale == null || Get.locale!.languageCode.contains("en")) {
            box.write("locale", "ar");
            Get.updateLocale(const Locale("ar"));
          } else if (Get.locale!.languageCode == "ar") {
            box.write("locale", "en");
            Get.updateLocale(const Locale("en"));
          }
          Get.find<HomeController>().getSuwar();
        },
        icon: const Icon(Icons.language_rounded),
      ),
    );
  }
}
