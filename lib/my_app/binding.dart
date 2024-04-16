import 'package:get/get.dart';
import 'package:quran/controllers/downloads_controller.dart';
import 'package:quran/controllers/home_controller.dart';

class BindingsForInit extends Bindings {
  @override
  void dependencies() {
    Get.put(
      HomeController(),
      permanent: true,
    );
    Get.put(
      DownloadsController(),
      permanent: true,
    );
  }
}
