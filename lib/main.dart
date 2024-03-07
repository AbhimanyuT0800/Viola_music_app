import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:music_app/data/data_source/object_box.dart/object_box_impl.dart';
import 'package:music_app/data/repositories/shared_pref_repo_impl/shared_perf_impl.dart';
import 'package:music_app/presentation/pages/home/access_denied/storage_access_denied.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'presentation/pages/on_boarding/loading_screen/loading_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPrefImpl.create();
  await JustAudioBackground.init(
    androidNotificationChannelId: 'com.ryanheise.bg_demo.channel.audio',
    androidNotificationChannelName: 'Audio playback',
    androidNotificationOngoing: true,
  );
  await ObjectBoxImpl.create();
  // await Permission.storage.request();

  runApp(
    const ProviderScope(
      child: MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: const Color(0xFF8e0e6d),
      ),
      debugShowCheckedModeBanner: false,
      home: const LoadingScreen(),
    );
  }
}
