import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_audio/just_audio.dart';
import 'package:music_app/data/model/songs_entity.dart';
import 'package:music_app/presentation/pages/play/playing_page.dart';
import 'package:music_app/presentation/providers/current_playing/is_palying.dart';
import 'package:music_app/presentation/providers/current_playing/music_player_provider.dart';
import 'package:music_app/presentation/providers/fav_db_music/music_db.dart';
import 'package:music_app/presentation/providers/favorites/is_favorites.dart';
import 'package:music_app/presentation/providers/music/get_all_music.dart';
import 'package:music_app/presentation/providers/play_list/get_all_music_data.dart';
import 'package:music_app/utils/dynamic_sizes/dynamic_sizes.dart';

class PlayListTile extends ConsumerWidget {
  const PlayListTile(
      {super.key,
      required this.title,
      required this.artist,
      required this.data,
      required this.index,
      required this.isPlayingFromFav});

  final int index;
  final String data;
  final String title;
  final String artist;
  final bool isPlayingFromFav;

  /// method to find the id(from data base) of fav song
  int getMusicEntity(
      {required String data, required List<SongsEntity> dbSongs}) {
    int id = 0;
    for (SongsEntity entity in dbSongs) {
      if (entity.data == data) {
        id = entity.id!;
      }
    }
    return id;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final player = ref.watch(musicPlayerProvider);
    return ListTile(
        // play the song contains
        onTap: () async {
          // if it is playing any song it will pause else do nothing
          player.pause();

          // navigate to playing page when tap on song details section
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CurrentPlayingPage(),
              ));

          if (!isPlayingFromFav) {
            //  get list of audio source
            final List<AudioSource> source = ref.read(
                getAllMusicPlayListProvider(
                    data: ref.read(getAllMusicProvider).value!));
            // Load and play the playlist
            await player.setAudioSource(
                ConcatenatingAudioSource(children: source),
                initialIndex: index);
            player.play();
            // update current index of playing song
            ref.watch(currentPlayingIndex.notifier).state = index;
            // togle isplaying provider
            ref.watch(isPlayingProvider.notifier).state = true;
          }
          // else {
          //   //  get list of audio source
          //   final List<AudioSource> source = ref.read(
          //       getAllMusicPlayListProvider(
          //           data: ref.read(getAllMusicProvider).value!));
          //   // Load and play the playlist
          //   await player.setAudioSource(
          //       ConcatenatingAudioSource(children: source),
          //       initialIndex: index);
          //   player.play();
          //   // update current index of playing song
          //   ref.watch(currentPlayingIndex.notifier).state = index;
          //   // togle isplaying provider
          //   ref.watch(isPlayingProvider.notifier).state = true;
          // }
        },
        // current imge of the music
        leading: InkWell(
          onTap: () {
            // navigate to playing page when press the circle avatar of tile
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const CurrentPlayingPage()));
          },
          child: const CircleAvatar(
            backgroundImage: AssetImage('assets/images/img_onboarding.jpg'),
          ),
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
                  /// check if the song is favorite
                  ref.read(isFavProvider(data: data))

                      /// if the song is favorite it remove from database
                      ? ref.read(musicDbProvider.notifier).removeSongs(
                          getMusicEntity(
                              dbSongs: ref.read(musicDbProvider), data: data))

                      /// if the song is not in the data base it will add to it
                      : ref.read(musicDbProvider.notifier).addSongs(SongsEntity(
                          artist: artist, title: title, data: data));
                  ref.invalidate(isFavProvider);
                },
                icon: ref.watch(IsFavProvider(data: data))
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
