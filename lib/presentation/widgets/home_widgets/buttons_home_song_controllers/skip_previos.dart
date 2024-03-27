import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:viola/presentation/providers/current_playing/music_player_provider.dart';

// button for kip to previos song
IconButton skipPreviosButton(WidgetRef ref) {
  return IconButton(
    icon: const Icon(Icons.skip_previous_sharp),
    // if it is the first song do nothing...!
    onPressed: () {
      // pause the current song and play the next song
      ref.read(musicPlayerProvider).seekToPrevious();
    },
    color: Colors.deepPurple,
  );
}
