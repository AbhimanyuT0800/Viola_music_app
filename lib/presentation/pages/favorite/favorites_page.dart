import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:music_app/domain/entity/songs_entity.dart';
import 'package:music_app/presentation/providers/favorites/fav_db_music/music_db.dart';
import 'package:music_app/presentation/widgets/home_widgets/play_list_tile_widget.dart';

class FavoritePage extends ConsumerWidget {
  const FavoritePage({super.key, required this.controller});
  // scrollController for scrollToHide
  final ScrollController controller;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<SongsEntity> favSongs = ref.read(musicDbProvider);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.deepPurple,
        // title
        title: Text(
          'Favorite',
          style: GoogleFonts.roboto(
              color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      // checks the box contaning fav  is empty or not
      body: favSongs.isEmpty
          ? const Center(
              child: Text('No Fav'),
            )
          // build the whole list from favSongs
          : ListView.builder(
              shrinkWrap: true,
              itemCount: favSongs.length,
              itemBuilder: (context, index) {
                return Card(
                  child: PlayListTile(
                    isPlayingFromFav: true,
                    artist: favSongs[index].artist ?? 'unknown',
                    data: favSongs[index].data,
                    title: favSongs[index].title!,
                    index: index,
                    // pass only favorite songs datas to play
                    listOfDatas:
                        ref.read(musicDbProvider).map((e) => e.data).toList(),
                  ),
                );
              },
            ),
    );
  }
}
