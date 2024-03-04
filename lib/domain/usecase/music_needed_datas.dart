import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:music_app/presentation/providers/current_playing/is_palying.dart';
import 'package:music_app/presentation/providers/current_playing/music_player_provider.dart';
import 'package:on_audio_query/on_audio_query.dart';

class MusicNeededDatas {
  final WidgetRef ref;
  final List<SongModel> data;

  MusicNeededDatas({
    required this.ref,
    required this.data,
  });

  Duration? getDuration() {
    ref
        .read(musicPlayerProvider)
        .setFilePath(data[ref.read(currentPlayingIndex)].data);
    Duration? duration;
    try {
      ref.read(musicPlayerProvider).durationStream.listen((event) {
        duration = event;
      });
      return duration;
    } catch (e) {
      log(e.toString());
      throw 'sf';
    }
  }

  Duration getPosition() {
    ref
        .read(musicPlayerProvider)
        .setFilePath(data[ref.read(currentPlayingIndex)].data);
    Duration position = const Duration();
    try {
      ref.read(musicPlayerProvider).positionStream.listen((event) {
        position = event;
      });
      return position;
    } catch (e) {
      log('position error:$e');
      throw '';
    }
  }
}
