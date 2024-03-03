import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:music_app/domain/usecase/play_music.dart';
import 'package:music_app/presentation/providers/current_playing/is_palying.dart';
import 'package:music_app/presentation/providers/current_playing/music_player_provider.dart';
import 'package:on_audio_query/on_audio_query.dart';

class PlayListTile extends StatelessWidget {
  const PlayListTile({
    super.key,
    required this.song,
    required this.ref,
  });
  final SongModel song;
  final WidgetRef ref;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () async {
        try {
          ref.watch(isPlayingProvider.notifier).state =
              !ref.read(isPlayingProvider);

          // if (ref.read(isPlayingProvider)) {
          //   await ref.watch(musicPlayerProvider).play();
          //   ref.watch(isPlayingProvider.notifier).state = false;
          // } else {
          //   await ref.watch(musicPlayerProvider).pause();
          //   ref.watch(isPlayingProvider.notifier).state = true;
          // }

          // method for playing the music
          log(ref.watch(isPlayingProvider).toString());
          ref.watch(isPlayingProvider)
              ? PlayMusicCase().playCurrentMusic(song)
              : PlayMusicCase().pauseCurrentMusic(song);
        } catch (e) {
          log('error::$e');
        }
      },
      // current imge of the music
      leading: const CircleAvatar(
        backgroundImage: AssetImage('assets/images/img_onboarding.jpg'),
      ),
      // title of the song
      title: Text(
        song.title,
        overflow: TextOverflow.ellipsis,
        maxLines: 2,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.deepPurple,
        ),
      ),
      // name of the artist
      subtitle: Text(
        song.artist!,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
          color: Colors.deepPurpleAccent,
        ),
      ),
      trailing: PopupMenuButton(
        itemBuilder: (context) => [
          PopupMenuItem(child: Text('share')),
          PopupMenuItem(child: Text('delete')),
          PopupMenuItem(child: Text('about'))
        ],
      ),
    );
  }
}
