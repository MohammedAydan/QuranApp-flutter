import 'package:get/get.dart';
import 'package:quran/models/sura.dart';

class Apis extends GetConnect {
  Future<List<Sura>> getAll() async {
    try {
      String lC = Get.locale!.languageCode.contains("ar") ? "ar" : "eng";
      String lang = "?language=$lC";

      final response = await get("https://mp3quran.net/api/v3/suwar$lang");

      if (response.status.hasError) {
        throw Exception(response.statusText.toString());
      } else {
        List<Sura> finalSuwar = (response.body['suwar'] as List)
            .map<Sura>((s) => Sura.fromJson(s))
            .toList();
        return finalSuwar;
      }
    } catch (e) {
      // Handle errors gracefully
      throw Exception('Failed to get suwar: $e');
    }
  }

  String getSuraUrl(int id) {
    String id_ = "${id.toString().padLeft(3, '0')}.mp3";
    return 'https://server11.mp3quran.net/yasser/$id_';
  }

  @override
  void onInit() {
    super.onInit();
    httpClient.timeout = const Duration(seconds: 20);
  }
}
