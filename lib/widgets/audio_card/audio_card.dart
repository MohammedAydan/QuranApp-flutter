import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran/controllers/home_controller.dart';
import 'package:quran/models/sura.dart';

class AudioCard extends StatelessWidget {
  const AudioCard({
    super.key,
    required this.sura,
    required this.controller,
  });

  final HomeController controller;

  final Sura sura;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {
          if (isSelected) {
            controller.play();
            return;
          }
          controller.selectSura(sura);
        },
        contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        leading: CircleAvatar(
          backgroundColor: context.theme.primaryColor,
          child: const Icon(Icons.audiotrack_rounded),
        ),
        title: Text("${"Surah".tr} ${sura.name} - (${sura.id})"),
        // subtitle: Text("Ayah $index"),
        trailing: SizedBox(
          width: 60,
          height: 25,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                onTap: () => controller.downloadSura(sura),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(
                      color: context.theme.colorScheme.secondary,
                    ),
                  ),
                  child: const Icon(Icons.download_rounded, size: 23),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: isSelected
                      ? Border.all(color: context.theme.colorScheme.secondary)
                      : null,
                ),
                child: trailing(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget trailing() {
    if (isSelected) {
      if (controller.playing) {
        return GestureDetector(
          onTap: () {
            controller.resumeOrPause();
          },
          child: const Icon(Icons.pause_rounded, size: 23),
        );
      } else {
        return GestureDetector(
          onTap: () {
            controller.resumeOrPause();
          },
          child: const Icon(Icons.play_arrow_rounded, size: 23),
        );
      }
    }
    return const Icon(Icons.play_arrow_rounded, size: 23);
  }

  bool get isSelected {
    if (controller.selectedSura == sura) {
      return true;
    }
    return false;
  }
}
