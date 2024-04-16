import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran/controllers/downloads_controller.dart';
import 'package:quran/models/file_model.dart';

class AudioCardDownload extends StatelessWidget {
  const AudioCardDownload({
    super.key,
    required this.sura,
    required this.controller,
    required this.index,
  });

  final DownloadsController controller;

  final FileModel sura;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onLongPress: () {
          showCupertinoDialog(
            context: context,
            builder: (context) {
              return CupertinoAlertDialog(
                title: Text("msg_for_delete_file".tr),
                actions: [
                  CupertinoDialogAction(
                    child: Text("yes".tr),
                    onPressed: () {
                      controller.deleteFile(sura.path);
                      Get.back();
                    },
                  ),
                  CupertinoDialogAction(
                    child: Text("no".tr),
                    onPressed: () {
                      Get.back();
                    },
                  ),
                ],
              );
            },
          );
        },
        onTap: () {
          if (isSelected) {
            controller.play();
            return;
          }
          controller.selectSura(sura, index);
        },
        contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        leading: CircleAvatar(
          backgroundColor: context.theme.primaryColor,
          child: const Icon(Icons.audiotrack_rounded),
        ),
        title: Text("${"Surah".tr} ${sura.name}"),
        // subtitle: Text("Ayah $index"),
        trailing: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            border: isSelected
                ? Border.all(color: context.theme.colorScheme.secondary)
                : null,
          ),
          child: trailing(),
        ),
      ),
    );
  }

  Widget trailing() {
    if (isSelected) {
      if (controller.playing) {
        return const Icon(Icons.pause_rounded, size: 23);
      } else {
        return const Icon(Icons.play_arrow_rounded, size: 23);
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
