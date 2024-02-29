import 'dart:developer';

import 'package:just_audio/just_audio.dart';
import 'package:on_audio_query/on_audio_query.dart' as model;

class PlayMusicCase {
  final player = AudioPlayer();
  Future<void> playCurrentntMusic(model.SongModel model) async {
    try {
      await player.setFilePath(model.data);
      player.play;
      log('hhha');
    } catch (e) {
      log(e.toString());
    }
  }
}
