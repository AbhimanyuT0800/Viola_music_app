import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:music_app/domain/entity/songs_entity.dart';
import 'package:music_app/presentation/providers/fav_db_music/music_db.dart';
import 'package:music_app/presentation/widgets/home_widgets/play_list_tile_widget.dart';

class FavoritePage extends ConsumerWidget {
  const FavoritePage({super.key, required this.controller});

  final ScrollController controller;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<SongsEntity> favSongs = ref.read(musicDbProvider);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Favorites'),
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
                itemBuilder: (context, index) => Card(
                  child: PlayListTile(
                    isPlayingFromFav: true,
                    artist: favSongs[index].artist ?? 'unknown',
                    data: favSongs[index].data!,
                    title: favSongs[index].title!,
                    index: index,
                  ),
                ),
              ));
  }
}
