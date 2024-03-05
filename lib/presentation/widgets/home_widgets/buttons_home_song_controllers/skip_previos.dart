import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_audio/just_audio.dart';
import 'package:music_app/presentation/providers/current_playing/is_palying.dart';
import 'package:on_audio_query/on_audio_query.dart';

IconButton skipPreviosButton(
    AudioPlayer player, WidgetRef ref, List<SongModel> data) {
  return IconButton(
    icon: const Icon(Icons.skip_previous_sharp),
    onPressed: () {
      if (player.playing) {
        // pause current playing song
        player.pause();
        if (ref.watch(currentPlayingIndex) != 0) {
          // minus one from current playing index
          ref.watch(currentPlayingIndex.notifier).state =
              ref.read(currentPlayingIndex) - 1;
        }
        // play music in current index
        player.setFilePath(data[ref.read(currentPlayingIndex)].data);
        player.play();
      } else {
        // if it is not playing just update current playing index
        ref.watch(currentPlayingIndex.notifier).state =
            ref.read(currentPlayingIndex) - 1;
      }
    },
    color: Colors.deepPurple,
  );
}
