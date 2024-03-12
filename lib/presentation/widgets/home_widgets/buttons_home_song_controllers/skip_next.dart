import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:music_app/presentation/providers/current_playing/music_player_provider.dart';

/// method for skip to next song
IconButton skipNextButton(WidgetRef ref) {
  return IconButton(
    icon: const Icon(Icons.skip_next),
// if it is the first song do nothing.....!
    onPressed: () {
      ref.read(musicPlayerProvider).seekToNext();
    },
    color: Colors.deepPurple,
  );
}
