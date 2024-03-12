import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:music_app/presentation/providers/current_playing/is_palying.dart';
import 'package:music_app/presentation/providers/current_playing/music_player_provider.dart';

IconButton pauseAndPlayButton(WidgetRef ref) {
  return IconButton(
    icon: ref.watch(isPlayingProvider)
        ? const Icon(Icons.pause)
        : const Icon(Icons.play_arrow),
    // controll sctn for play and pause
    onPressed: () {
      // change isPlaying provider
      ref.invalidate(isPlayingProvider);
      if (ref.read(isPlayingProvider)) {
        // pause current song if it is playing
        ref.read(musicPlayerProvider).pause();
        // invalidate isPlaying
        ref.invalidate(isPlayingProvider);
      } else {
        ref.read(musicPlayerProvider).play();
        // invalidate isPlaying

        ref.invalidate(isPlayingProvider);
      }
    },
    color: Colors.deepPurple,
    iconSize: 48.0,
  );
}
