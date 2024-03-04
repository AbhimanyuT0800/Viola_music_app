import 'dart:developer';

import 'package:just_audio/just_audio.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'play_music.g.dart';

class PlayMusicCase {
  final player = AudioPlayer();

  Future<void> playCurrentMusic(SongModel model) async {
    try {
      await player.setFilePath(model.data);

      // Now wait for audio playback to start
      await player.play();

      log('Audio playback started successfully');
    } catch (e, stackTrace) {
      log('Error playing audio: $e', error: e, stackTrace: stackTrace);
    }
  }

  Future<void> pauseCurrentMusic(SongModel model) async {
    try {
      log('pause');

      player.pause();
    } catch (e) {
      log(e.toString());
    }
  }
}

@riverpod
PlayMusicCase playMusicCase(PlayMusicCaseRef ref) {
  return PlayMusicCase();
}
