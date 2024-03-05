import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_audio/just_audio.dart';
import 'package:music_app/presentation/providers/current_playing/is_palying.dart';
import 'package:music_app/presentation/providers/play_list/get_all_music_data.dart';
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
        //  get list of audio source
        final List<AudioSource> source = ref.read(getAllMusicPlayListProvider);
// Load and play the playlist
        await player.setAudioSource(ConcatenatingAudioSource(children: source),
            initialIndex: ref.read(currentPlayingIndex));
        player.play();
      }
    },
    color: Colors.deepPurple,
    iconSize: 48.0,
  );
}
