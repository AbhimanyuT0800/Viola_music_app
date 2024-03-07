import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:music_app/presentation/pages/favorite/favorites_page.dart';
import 'package:music_app/presentation/pages/play/playing_page.dart';
import 'package:music_app/presentation/providers/current_playing/is_palying.dart';
import 'package:music_app/presentation/providers/current_playing/music_player_provider.dart';
import 'package:music_app/presentation/providers/music/get_all_music.dart';
import 'package:music_app/presentation/widgets/home_widgets/buttons_home_song_controllers/play_and_pause.dart';
import 'package:music_app/presentation/widgets/home_widgets/buttons_home_song_controllers/skip_next.dart';
import 'package:music_app/presentation/widgets/home_widgets/buttons_home_song_controllers/skip_previos.dart';
import 'package:music_app/presentation/widgets/home_widgets/current_playing_dtls.dart';
import 'package:music_app/presentation/widgets/home_widgets/play_list_tile_widget.dart';
import 'package:music_app/presentation/widgets/home_widgets/progress_indicator.dart';
import 'package:music_app/utils/dynamic_sizes/dynamic_sizes.dart';

class HomePage extends ConsumerWidget {
  final ScrollController scrollController;

  const HomePage({
    super.key,
    required this.scrollController,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // provider for music is playing or not
    bool isPlaying = ref.watch(isPlayingProvider);
    // provider for audio player
    final player = ref.watch(musicPlayerProvider);

    return RefreshIndicator(
      onRefresh: () {
        // delay for refresh indicator showing
        return Future.delayed(const Duration(seconds: 3));
      },
      child: ref.watch(getAllMusicProvider).when(
            data: (data) {
              // ui will rebuild and shows data when data has come
              return CustomScrollView(
                // controller for bottom navigation bar
                controller: scrollController,
                slivers: [
                  // title app bar
                  SliverAppBar(
                    automaticallyImplyLeading: false,
                    backgroundColor: Colors.deepPurple,
                    title: Text(
                      'Viola',
                      style: GoogleFonts.roboto(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w700),
                    ),
                    actions: [
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const FavoritePage()));
                        },
                        icon: const Icon(
                          Icons.favorite,
                          color: Colors.red,
                        ),
                      )
                    ],
                  ),
                  // topside section which contain data of current playing music
                  SliverToBoxAdapter(
                    child: InkWell(
                        onTap: () {
                          // navigate to playing page when tap on song details section
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const CurrentPlayingPage()));
                        },
                        child: currentPlayingMusic(data, ref)),
                  ),
                  // music controlls section
                  SliverAppBar(
                    automaticallyImplyLeading: false,
                    pinned: true,
                    toolbarHeight: context.screenHeight(50),
                    title: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          // buttons for controll next,previous and paus/play
                          skipPreviosButton(player, ref, data),
                          pauseAndPlayButton(isPlaying, player, ref, data),
                          skipNextButton(player, ref, data)
                        ],
                      ),
                    ),
                    bottom: const PreferredSize(
                        preferredSize: Size(100, 15), child: SizedBox()),
                  ), // mp3 files stored in local storage
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      childCount: data.length,
                      (context, index) => Card(
                        child: PlayListTile(
                          isPlayingFromFav: false,
                          artist: data[index].artist!,
                          data: data[index].data,
                          title: data[index].title,
                          index: index,
                        ),
                      ),
                    ),
                  )
                ],
              );
            },
            error: (error, stackTrace) {
              log(error.toString());
              return const Center(
                child: Text('Sorry No Songs found'),
              );
            },
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
          ),
    );
  }
}
