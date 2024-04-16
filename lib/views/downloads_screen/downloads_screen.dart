import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran/controllers/downloads_controller.dart';
import 'package:quran/widgets/custom_bottom_navigation_bar_for_downloads/custom_bottom_navigation_bar_for_downloads.dart';
import 'package:quran/widgets/search_form_widget_for_downloads/search_form_widget_for_downloads.dart';
import '../../widgets/container_show_downloads/container_show_downloads.dart';

class DownloadsScreen extends StatelessWidget {
  static const String routeName = "/downloads";

  DownloadsScreen({super.key});
  final DownloadsController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DownloadsController>(
      init: controller,
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Downloads".tr),
            centerTitle: true,
          ),
          body: Column(
            children: [
              SearchFormWidgetForDownloads(controller: controller),
              if (controller.downloads.isEmpty && controller.isLoading) ...[
                const Expanded(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              ] else if (controller.downloads.isEmpty) ...[
                Expanded(
                  child: Center(
                    child: IconButton.outlined(
                      onPressed: () {
                        controller.getDownloadedFiles();
                      },
                      icon: const Icon(Icons.refresh_rounded),
                    ),
                  ),
                ),
              ],
              if (controller.downloads.isNotEmpty) ...[
                ContainerShowDownloads(controller: controller),
              ],
            ],
          ),
          bottomNavigationBar: CustomBottomNavigationBarForDownloads(
            controller: controller,
          ),
        );
      },
    );
  }
}
