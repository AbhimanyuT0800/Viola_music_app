import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_audio/just_audio.dart';
import 'package:on_audio_query/on_audio_query.dart';

// button for kip to previos song
IconButton skipPreviosButton(
    AudioPlayer player, WidgetRef ref, List<SongModel> data) {
  return IconButton(
    icon: const Icon(Icons.skip_previous_sharp),
    // if it is the first song do nothing...!
    onPressed: () {
      // pause the current song and play the next song
      if (player.playing) {
        player.pause();
        player.seekToPrevious();
        player.play();
      } else {
        //  just seek to next song
        player.seekToPrevious();
      }
    },
    color: Colors.deepPurple,
  );
}
