import 'dart:developer';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:quran/controllers/downloads_controller.dart';
import 'package:quran/models/sura.dart';
import 'package:quran/services/apis.dart';
import 'package:quran/services/load_suwar.dart';

class HomeController extends GetxController {
  List<Sura> suwar = [];
  bool isLoading = false;
  Sura? selectedSura;
  AssetsAudioPlayer player = AssetsAudioPlayer();
  Duration? duration;
  bool playing = false;
  TextEditingController searchController = TextEditingController();
  Apis apis = Apis();
  DownloadsController? downloadsController;

  Future getSuwar() async {
    try {
      isLoading = true;
      update();
      // get from api
      // suwar = await apis.getAll();

      // get from json file
      String localeCode = Get.locale!.languageCode.contains("ar") ? "ar" : "en";
      suwar = await getSuwarForJsonFile(localeCode);
      update();
      initPlayer();
    } catch (e) {
      // Handle error
      Get.snackbar("Error", e.toString());
      log(e.toString());
    } finally {
      isLoading = false;
      update();
    }
  }

  void initPlayer() async {
    try {
      List<String> urls = suwar.map((e) => apis.getSuraUrl(e.id!)).toList();
      await player.open(
        Playlist(audios: urls.map((e) => Audio.network(e)).toList()),
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

  void selectSura(Sura sura) {
    selectedSura = sura;

    player.playlistPlayAtIndex(sura.id! - 1);
    playing = true;
    update();
    updateCurrentAudioNotification(sura);

    // listenPlayerState();
    update();
  }

  void updateCurrentAudioNotification(Sura sura) {
    player.updateCurrentAudioNotification(
      metas: Metas(
        id: selectedSura?.id.toString(),
        title: sura.name,
        artist: "Yasser Al-Dosari - الشيخ ياسر الدوسري",
      ),
      showNotifications: true,
    );
  }

  void listenPlayerState() {
    player.playerState.listen((state) {
      if (state.toString().contains("play")) {
        playing = true;
        Get.find<DownloadsController>().player.pause();
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
      suwar.sort((a, b) => a.id!.compareTo(b.id!));
      update();
      return;
    }
    final s = suwar.where((s) => s.name!.contains(v));
    suwar = suwar.where((s) => !(s.name!.contains(v))).toList();
    suwar.insertAll(0, s);
    update();
  }

  void downloadSura(Sura sura) async {
    try {
      // Download sura
      final path = await getApplicationDocumentsDirectory();
      String? taskId = await FlutterDownloader.enqueue(
        url: apis.getSuraUrl(sura.id!),
        savedDir: path.path,
        showNotification: true,
        openFileFromNotification: false,
        fileName: "AUDIO-${sura.name}-id=${sura.id}.mp3",
        timeout: 25000,
      );
      if (taskId != null) {
        await FlutterDownloader.open(taskId: taskId);
      } else {
        throw Exception("Task ID is null");
      }
    } catch (e) {
      print("Error downloading sura: $e");
      // Handle error as needed
    }
  }

  @override
  void onReady() {
    super.onReady();
    getSuwar();
    player.current.listen((event) {
      if (event == null) return;
      selectedSura = suwar[event.index];
      update();
    });
    listenPlayerState();
  }

  @override
  void dispose() {
    super.dispose();
    player.dispose();
    searchController.dispose();
  }
}
