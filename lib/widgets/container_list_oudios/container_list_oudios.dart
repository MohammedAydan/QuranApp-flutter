import 'package:flutter/material.dart';
import 'package:quran/controllers/home_controller.dart';
import 'package:quran/models/sura.dart';
import '../audio_card/audio_card.dart';

class ContainerListOudios extends StatelessWidget {
  const ContainerListOudios({
    super.key,
    required this.controller,
  });
  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RefreshIndicator(
        color: Theme.of(context).progressIndicatorTheme.color,
        backgroundColor: Theme.of(context).primaryColor,
        onRefresh: () async {
          await controller.getSuwar();
        },
        child: ListView.builder(
          itemCount: controller.suwar.length,
          itemBuilder: (context, index) {
            Sura sura = controller.suwar[index];
            return AudioCard(
              controller: controller,
              sura: sura,
            );
          },
        ),
      ),
    );
  }
}
