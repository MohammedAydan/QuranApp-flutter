import 'package:flutter/material.dart';
import 'package:quran/controllers/downloads_controller.dart';
import 'package:quran/models/file_model.dart';
import 'package:quran/widgets/audio_card_download/audio_card_download.dart';

class ContainerShowDownloads extends StatelessWidget {
  const ContainerShowDownloads({
    super.key,
    required this.controller,
  });
  final DownloadsController controller;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RefreshIndicator(
        color: Theme.of(context).progressIndicatorTheme.color,
        backgroundColor: Theme.of(context).primaryColor,
        onRefresh: () async {
          await controller.getDownloadedFiles();
        },
        child: ListView.builder(
          itemCount: controller.downloads.length,
          itemBuilder: (context, index) {
            FileModel sura = controller.downloads[index];
            return AudioCardDownload(
              sura: sura,
              controller: controller,
              index: index,
            );
          },
        ),
      ),
    );
  }
}
