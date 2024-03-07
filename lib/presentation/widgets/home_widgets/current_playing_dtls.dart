import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_audio/just_audio.dart';
import 'package:music_app/presentation/providers/current_playing/is_palying.dart';
import 'package:music_app/presentation/providers/current_playing/music_player_provider.dart';
import 'package:on_audio_query/on_audio_query.dart';

// Builder for currently playing song details
StreamBuilder currentPlayingMusic(List<SongModel> song, WidgetRef ref) {
  // AudioPlayer obj
  final AudioPlayer player = ref.read(musicPlayerProvider);
  return StreamBuilder(
      // stream of current playing index
      stream: player.currentIndexStream,
      builder: (context, snapShot) {
        ref.watch(currentPlayingIndex.notifier).state = snapShot.data ?? 0;
        return Container(
          padding: const EdgeInsets.all(16.0),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.deepPurple,
                Colors.deepPurpleAccent,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Now Playing',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10.0),
              const CircleAvatar(
                radius: 80.0,
                backgroundImage:
                    AssetImage('assets/images/img_onboardig_2.png'),
              ),
              const SizedBox(height: 10.0),
              Text(
                // if it is playing shows its details else shows details of
                // first file
                song[snapShot.data ?? 0].displayName,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                // if it is playing shows its details else shows details of
                // first file
                song[snapShot.data ?? 0].album ?? 'unknown',
                style: const TextStyle(
                  fontSize: 18.0,
                  color: Colors.white70,
                ),
              ),
            ],
          ),
        );
      });
}
