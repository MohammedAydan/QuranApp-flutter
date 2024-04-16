import 'package:get/get.dart';
import 'package:quran/services/translations/translation_ar.dart';
import 'package:quran/services/translations/translation_en.dart';

class Translation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        "en": translationEn,
        "ar": translationAr,
      };
}
