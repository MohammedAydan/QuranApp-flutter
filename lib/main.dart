import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:get_storage/get_storage.dart';
import 'my_app/my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await FlutterDownloader.initialize(
    debug: true,
    ignoreSsl: true,
  );
  AssetsAudioPlayer.addNotificationOpenAction((notification) => true);
  AssetsAudioPlayer.setupNotificationsOpenAction((notification) {
    return true;
  });


  runApp(const MyApp());
}
