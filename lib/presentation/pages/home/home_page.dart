import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:music_app/presentation/providers/current_playing/is_played_once.dart';
import 'package:music_app/presentation/providers/music/get_all_music.dart';
import 'package:music_app/presentation/widgets/home_widgets/buttons_home_song_controllers/play_and_pause.dart';
import 'package:music_app/presentation/widgets/home_widgets/buttons_home_song_controllers/skip_next.dart';
import 'package:music_app/presentation/widgets/home_widgets/buttons_home_song_controllers/skip_previos.dart';
import 'package:music_app/presentation/widgets/home_widgets/current_playing_dtls.dart';
import 'package:music_app/presentation/widgets/home_widgets/play_list_tile_widget.dart';
import 'package:music_app/utils/dynamic_sizes/dynamic_sizes.dart';

class HomePage extends ConsumerWidget {
  final ScrollController scrollController;

  const HomePage({
    super.key,
    required this.scrollController,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // provider for audio player

    return RefreshIndicator(
      onRefresh: () {
        // delay for refresh indicator showing
        return Future.delayed(const Duration(seconds: 1));
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
                  ),
                  // topside section which contain data of current playing music
                  SliverToBoxAdapter(
                    child: InkWell(
                        onTap: () {}, child: currentPlayingMusic(data, ref)),
                  ),
                  // music controlls section
                  ref.watch(isPlayedOnceProvider)
                      ? SliverAppBar(
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
                                skipPreviosButton(ref),
                                pauseAndPlayButton(ref),
                                skipNextButton(ref)
                              ],
                            ),
                          ),
                          bottom: const PreferredSize(
                              preferredSize: Size(100, 15), child: SizedBox()),
                        )
                      : SliverAppBar(
                          toolbarHeight: 5,
                        ), // mp3 files stored in local storage
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      childCount: data.length,
                      (context, index) {
                        // dispose whole activity in audioplayer
                        // ref.read(musicPlayerProvider).dispose();
                        return Card(
                          child: PlayListTile(
                            isPlayingFromFav: false,
                            artist: data[index].artist!,
                            data: data[index].data,
                            title: data[index].title,
                            index: index,
                            listOfDatas: ref
                                .read(getAllMusicProvider)
                                .value!
                                .map((e) => e.data)
                                .toList(),
                          ),
                        );
                      },
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
