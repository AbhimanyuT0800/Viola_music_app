import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_audio/just_audio.dart';
import 'package:music_app/presentation/providers/current_playing/is_palying.dart';
import 'package:on_audio_query/on_audio_query.dart';

IconButton pauseAndPlayButton(
    bool isPlaying, AudioPlayer player, WidgetRef ref, List<SongModel> data) {
  return IconButton(
    icon: isPlaying ? const Icon(Icons.pause) : const Icon(Icons.play_arrow),
    // controll sctn for play and pause
    onPressed: () async {
      if (player.playing) {
        // change isPlaying provider
        ref.read(isPlayingProvider.notifier).state =
            !ref.watch(isPlayingProvider);
        // pause current song if itis playing
        player.pause();
      } else {
        // change isPlaying provider
        ref.read(isPlayingProvider.notifier).state =
            !ref.watch(isPlayingProvider);
        // if it is not playing a song play last played song
        //?? it will play first song
        await player.setFilePath(data[ref.read(currentPlayingIndex)].data);
        player.play();
      }
    },
    color: Colors.deepPurple,
    iconSize: 48.0,
  );
}
