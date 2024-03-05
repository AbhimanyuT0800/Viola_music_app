import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:music_app/data/model/songs_entity.dart';
import 'package:music_app/presentation/providers/db_music/music_db.dart';
import 'package:music_app/presentation/widgets/home_widgets/play_list_tile_widget.dart';

class FavoritePage extends ConsumerWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<SongsEntity> favSongs = ref.read(musicDbProvider);
    return Scaffold(
        body: ref.watch(musicDbProvider).isEmpty
            ? const Center(
                child: Text('No Fav'),
              )
            : ListView.builder(
                shrinkWrap: true,
                itemCount: favSongs.length,
                itemBuilder: (context, index) => Card(
                  child: PlayListTile(
                    artist: favSongs[index].artist ?? 'unknown',
                    data: favSongs[index].data!,
                    title: favSongs[index].title!,
                    index: index,
                  ),
                ),
              ));
  }
}
