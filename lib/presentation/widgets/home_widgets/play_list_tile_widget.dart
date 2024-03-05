import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:music_app/data/model/songs_entity.dart';
import 'package:music_app/presentation/providers/current_playing/is_palying.dart';
import 'package:music_app/presentation/providers/current_playing/music_player_provider.dart';
import 'package:music_app/presentation/providers/db_music/music_db.dart';
import 'package:music_app/utils/dynamic_sizes/dynamic_sizes.dart';

class PlayListTile extends ConsumerWidget {
  const PlayListTile({
    super.key,
    required this.title,
    required this.artist,
    required this.data,
    required this.index,
  });

  final int index;
  final String data;
  final String title;
  final String artist;

  bool isFav({required String data, required WidgetRef ref}) {
    bool isFav = false;
    List<SongsEntity> listOfmusic = ref.read(musicDbProvider);
    for (SongsEntity model in listOfmusic) {
      if (model.data == data) {
        isFav = true;
        break;
      }
    }
    return isFav;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final player = ref.watch(musicPlayerProvider);
    return ListTile(
        onTap: () async {
          player.pause();

          await player.setFilePath(data);
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
          title,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.deepPurple,
          ),
        ),
        // name of the artist
        subtitle: Text(
          artist,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            color: Colors.deepPurpleAccent,
          ),
        ),
        trailing: SizedBox(
          width: context.screenWidth(114),
          child: Row(
            children: [
              PopupMenuButton(
                itemBuilder: (context) => [
                  const PopupMenuItem(child: Text('share')),
                  const PopupMenuItem(child: Text('delete')),
                  const PopupMenuItem(child: Text('about'))
                ],
              ),
              IconButton(
                onPressed: () {
                  ref.read(musicDbProvider.notifier).addSongs(
                      SongsEntity(artist: artist, title: title, data: data));
                },
                icon: isFav(data: data, ref: ref)
                    ? const Icon(
                        Icons.favorite,
                        color: Colors.red,
                      )
                    : const Icon(Icons.favorite),
              )
            ],
          ),
        ));
  }
}
