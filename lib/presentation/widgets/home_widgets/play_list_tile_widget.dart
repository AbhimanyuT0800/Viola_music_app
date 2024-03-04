import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:music_app/presentation/providers/current_playing/is_palying.dart';
import 'package:music_app/presentation/providers/current_playing/music_player_provider.dart';
import 'package:on_audio_query/on_audio_query.dart';

class PlayListTile extends ConsumerWidget {
  const PlayListTile({super.key, required this.song, required this.index});
  final SongModel song;
  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final player = ref.watch(musicPlayerProvider);
    return ListTile(
      onTap: () async {
        player.pause();

        await player.setFilePath(song.data);
        player.play();
        ref.watch(currentPlayingIndex.notifier).state = index;
        ref.watch(isPlayingProvider.notifier).state = true;
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
          const PopupMenuItem(child: Text('share')),
          const PopupMenuItem(child: Text('delete')),
          const PopupMenuItem(child: Text('about'))
        ],
      ),
    );
  }
}
