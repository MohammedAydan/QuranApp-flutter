import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran/controllers/home_controller.dart';
import 'package:quran/widgets/theme_mode_button/theme_mode_button.dart';
import 'package:quran/widgets/translation_button/translation_button.dart';

import '../../widgets/container_list_oudios/container_list_oudios.dart';
import '../../widgets/custom_bottom_navigation_bar/custom_bottom_navigation_bar.dart';
import '../../widgets/search_form_widget/search_form_widget.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = "/Home";
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: Text("QuranApp".tr),
            actions: const [
              SizedBox(
                width: 10,
              ),
              ThemeModeButton(),
              TranslationButton(),
              SizedBox(
                width: 10,
              ),
            ],
          ),
          body: Column(
            children: [
              SearchFormWidget(controller: controller),
              if (controller.suwar.isEmpty && controller.isLoading) ...[
                const Expanded(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              ] else if (controller.suwar.isEmpty) ...[
                Expanded(
                  child: Center(
                    child: IconButton.outlined(
                      onPressed: () {
                        controller.getSuwar();
                      },
                      icon: const Icon(Icons.refresh_rounded),
                    ),
                  ),
                ),
              ],
              if (controller.suwar.isNotEmpty) ...[
                ContainerListOudios(controller: controller),
              ],
            ],
          ),
          bottomNavigationBar: CustomBottomNavigationBar(
            controller: controller,
          ),
        );
      },
    );
  }
}
