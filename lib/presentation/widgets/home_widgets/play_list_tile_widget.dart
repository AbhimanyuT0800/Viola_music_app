import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:viola/domain/entity/songs_entity.dart';
import 'package:viola/presentation/pages/play/playing_page.dart';
import 'package:viola/presentation/providers/current_playing/is_palying.dart';
import 'package:viola/presentation/providers/current_playing/is_played_once.dart';
import 'package:viola/presentation/providers/current_playing/music_player_provider.dart';
import 'package:viola/presentation/providers/favorites/fav_db_music/music_db.dart';
import 'package:viola/presentation/providers/favorites/is_favorites.dart';
import 'package:viola/presentation/providers/favorites/get_id_from_fav/get_music_entity.dart';
import 'package:viola/presentation/providers/play_list/get_all_music_data.dart';
import 'package:viola/utils/dynamic_sizes/dynamic_sizes.dart';

class PlayListTile extends ConsumerWidget {
  const PlayListTile(
      {super.key,
      required this.title,
      required this.artist,
      required this.data,
      required this.index,
      this.isPlayingFromFav = false,
      this.isPlayingFromSearch = false,
      required this.listOfDatas});

  final int index;
  final String data;
  final String title;
  final String artist;
  final bool isPlayingFromFav;
  final bool isPlayingFromSearch;
  final List<String> listOfDatas;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
        // play the song contains
        onTap: () async {
          ref.watch(isPlayedOnceProvider.notifier).state = true;

          ref.invalidate(getMusicPlayListProvider);
          // ref.read(musicPlayerProvider).dispose();

          // if it is playing any song it will pause else do nothing
          ref.read(musicPlayerProvider).pause();

          if (isPlayingFromFav) {
            // navigate to playing page when tap on song details section
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CurrentPlayingPage(
                    isPlayingFromFav: true,
                  ),
                ));
          } else if (isPlayingFromSearch) {
            // navigate to playing page when tap on song details section
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CurrentPlayingPage(
                    isPlayingFromSearch: true,
                  ),
                ));
          } else {
            // navigate to playing page when tap on song details section
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CurrentPlayingPage(),
                ));
          }

          // initialise audio source
          final List<AudioSource> source =
              ref.read(getMusicPlayListProvider(data: listOfDatas));
          // ref.read(musicPlayerProvider).stop();
          // Load and play the playlist
          await ref.read(musicPlayerProvider).setAudioSource(
              ConcatenatingAudioSource(children: source),
              initialIndex: index);
          ref.read(musicPlayerProvider).play();

          //  invalidate isplaying to update
          ref.invalidate(isPlayingProvider);
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
            backgroundImage: AssetImage('assets/animations/viola_logo.png'),
          ),
        ),
        // title of the song
        title: Text(title.split('-').removeAt(0),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: GoogleFonts.eduNswActFoundation(
              fontWeight: FontWeight.w600,
              color: Colors.deepPurple,
            )),
        // name of the artist
        subtitle: Text(
          artist,
          maxLines: 1,
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
                      ? ref.read(musicDbProvider.notifier).removeSongs(ref.read(
                          getMusicEntityProvider(
                              dbSongs: ref.read(musicDbProvider), data: data)))

                      /// if the song is not in the data base it will add to it
                      : ref.read(musicDbProvider.notifier).addSongs(SongsEntity(
                            artist: artist,
                            title: title,
                            data: data,
                          ));
                  ref.invalidate(isFavProvider);
                  ref.invalidate(musicDbProvider);
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
