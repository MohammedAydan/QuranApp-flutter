import 'dart:developer';
import 'dart:io';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:quran/controllers/home_controller.dart';

import '../models/file_model.dart';

class DownloadsController extends GetxController {
  List<FileModel> downloads = [];
  bool isLoading = false;
  FileModel? selectedSura;
  AssetsAudioPlayer player = AssetsAudioPlayer();
  Duration? duration;
  bool playing = false;
  TextEditingController searchController = TextEditingController();
  HomeController homeController = Get.find();

  Future getDownloadedFiles() async {
    try {
      // Get the application documents directory
      Directory directory = await getApplicationDocumentsDirectory();
      // Get a list of files in the directory
      List<FileSystemEntity> files = directory.listSync();

      if (files.isNotEmpty) {
        final auidoFiles = files
            .where((FileSystemEntity e) => e.path.contains("AUDIO-"))
            .toList();

        final convertedFiles =
            auidoFiles.map((e) => FileModel.fromMap(e)).toList();

        downloads = convertedFiles;
        update();
        initPlayer();
      }
    } catch (e) {
      // Handle error
    }
  }

  Future deleteFile(String filePath) async {
    try {
      // Check if the file exists
      if (await File(filePath).exists()) {
        // Delete the file
        await File(filePath).delete();
        print('File deleted successfully.');
        getDownloadedFiles();
        if (selectedSura?.path == filePath) {
          selectedSura = null;
          update();
        }
      } else {
        print('File not found.');
      }
    } catch (e) {
      print('Error deleting file: $e');
    }
  }

  void initPlayer() async {
    try {
      List<String> urls = downloads.map((e) => e.path).toList();
      await player.open(
        Playlist(audios: urls.map((e) => Audio.file(e)).toList()),
        autoStart: false,
        showNotification: true,
        playInBackground: PlayInBackground.enabled,
        notificationSettings: const NotificationSettings(
          prevEnabled: true,
          nextEnabled: true,
          playPauseEnabled: true,
          seekBarEnabled: true,
          stopEnabled: false,
        ),
        forceOpen: true,
      );
    } catch (e) {
      // Handle error
      Get.snackbar("Error", e.toString());
      log(e.toString());
    }
  }

  void selectSura(FileModel sura, int index) {
    homeController.player.pause();
    selectedSura = sura;

    player.playlistPlayAtIndex(index);
    playing = true;
    update();
    updateCurrentAudioNotification(sura);

    // listenPlayerState();
    update();
  }

  void updateCurrentAudioNotification(FileModel sura) {
    player.updateCurrentAudioNotification(
      metas: Metas(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        title: sura.name,
        artist: "Yasser Al-Dosari - الشيخ ياسر الدوسري",
      ),
      showNotifications: true,
    );
  }

  void listenPlayerState() {
    player.playerState.listen((state) {
      if (state.toString().contains("play")) {
        homeController.player.pause();
        playing = true;
      } else if (state.toString().contains("pause")) {
        playing = false;
      } else {
        playing = false;
      }
      update();
    });
  }

  void resumeOrPause() {
    player.playOrPause();
    playing = !playing;
    update();
  }

  void play() {
    player.play();
    if (!playing) {
      playing = !playing;
    }
    update();
  }

  void unSelectSura() {
    playing = false;
    selectedSura = null;
    player.stop();
    update();
  }

  void search(String v) {
    if (v.isEmpty) {
      downloads.sort((a, b) => a.id.compareTo(b.id));
      update();
      return;
    }
    final s = downloads.where((s) => s.name.contains(v));
    downloads = downloads.where((s) => !(s.name.contains(v))).toList();
    downloads.insertAll(0, s);
    update();
  }

  @override
  void onReady() {
    super.onReady();
    player.current.listen((event) {
      if (event == null) return;
      if (selectedSura == null) return;
      selectedSura = downloads[event.index];
      update();
    });
    listenPlayerState();
    getDownloadedFiles();
  }

  @override
  void dispose() {
    super.dispose();
    player.dispose();
    searchController.dispose();
  }
}
