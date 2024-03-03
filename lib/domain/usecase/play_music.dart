import 'dart:developer';
import 'dart:io';

import 'package:just_audio/just_audio.dart';
import 'package:on_audio_query/on_audio_query.dart';

class PlayMusicCase {
  final player = AudioPlayer();

  Future<void> playCurrentMusic(SongModel model) async {
    try {
      await player.setFilePath(model.data);

      // Now wait for audio playback to start before logging
      await player.play();

      log('Audio playback started successfully');
    } catch (e, stackTrace) {
      log('Error playing audio: $e', error: e, stackTrace: stackTrace);
    }
  }

  Future<void> pauseCurrentMusic(SongModel model) async {
    try {
      log('pause');
      await player.setFilePath(model.data);
      await player.pause();
    } catch (e) {
      log(e.toString());
    }
  }
}
