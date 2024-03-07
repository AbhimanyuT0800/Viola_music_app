
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_audio/just_audio.dart';
import 'package:on_audio_query/on_audio_query.dart';

/// method for skip to next song
IconButton skipNextButton(
    AudioPlayer player, WidgetRef ref, List<SongModel> data) {
  return IconButton(
    icon: const Icon(Icons.skip_next),
// if it is the first song do nothing.....!
    onPressed: () {
      if (player.playing) {
        // pause current song and play the next song

        player.seekToNext();
        player.play();
      } else {
        // just seek to next song
        player.seekToNext();
      }
    },
    color: Colors.deepPurple,
  );
}
