import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:music_app/domain/usecase/fetch_all_music_case.dart';
import 'package:music_app/presentation/providers/current_playing/is_palying.dart';
import 'package:music_app/presentation/providers/current_playing/music_player_provider.dart';
import 'package:music_app/presentation/providers/music/get_all_music.dart';
import 'package:music_app/presentation/widgets/home_widgets/current_playing_dtls.dart';
import 'package:music_app/presentation/widgets/home_widgets/play_list_tile_widget.dart';
import 'package:music_app/presentation/widgets/home_widgets/progress_indicator.dart';
import 'package:music_app/utils/dynamic_sizes/dynamic_sizes.dart';
import 'package:on_audio_query/on_audio_query.dart';

class HomePage extends ConsumerWidget {
  final ScrollController scrollController;

  HomePage({
    super.key,
    required this.scrollController,
  });

  final Future<List<SongModel>> allSongs = FetchAudioFiles().fetchAudio();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // provider for music is playing or not
    bool isPlaying = ref.watch(isPlayingProvider);
    // provider for audio player
    final player = ref.watch(musicPlayerProvider);

    return RefreshIndicator(
      onRefresh: () async {
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
                    child: currentPlayingMusic(
                        data[ref.watch(currentPlayingIndex)]),
                  ),
                  // music controlls section
                  SliverAppBar(
                    pinned: true,
                    title: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.skip_previous_sharp),
                            onPressed: () {
                              if (player.playing) {
                                // pause current playing song
                                player.pause();
                                if (ref.watch(currentPlayingIndex) != 0) {
                                  // minus one from current playing index
                                  ref
                                          .watch(currentPlayingIndex.notifier)
                                          .state =
                                      ref.read(currentPlayingIndex) - 1;
                                }
                                // play music in current index
                                player.setFilePath(
                                    data[ref.read(currentPlayingIndex)].data);
                                player.play();
                              } else {
                                // if it is not playing just update current playing index
                                ref.watch(currentPlayingIndex.notifier).state =
                                    ref.read(currentPlayingIndex) - 1;
                              }
                            },
                            color: Colors.deepPurple,
                          ),
                          IconButton(
                            icon: isPlaying
                                ? const Icon(Icons.pause)
                                : const Icon(Icons.play_arrow),
                            // controll sctn forf play and pause
                            onPressed: () async {
                              if (player.playing) {
                                // change isPlaying provider
                                ref.read(isPlayingProvider.notifier).state =
                                    !ref.watch(isPlayingProvider);
                                // pause current song if itis playing
                                player.pause();
                              } else {
                                // change isPlaying provider
                                ref.read(isPlayingProvider.notifier).state =
                                    !ref.watch(isPlayingProvider);
                                // if it is not playing a song play last played song
                                //?? it will play first song
                                await player.setFilePath(
                                    data[ref.read(currentPlayingIndex)].data);
                                player.play();
                              }
                            },
                            color: Colors.deepPurple,
                            iconSize: 48.0,
                          ),
                          IconButton(
                            icon: const Icon(Icons.skip_next),
                            onPressed: () {
                              if (player.playing) {
                                player.pause();
                                if (ref.watch(currentPlayingIndex) !=
                                    data.length - 1) {
                                  // add one in to current playing index
                                  ref
                                          .watch(currentPlayingIndex.notifier)
                                          .state =
                                      ref.read(currentPlayingIndex) + 1;
                                }
                                // play music in current index
                                player.setFilePath(
                                    data[ref.read(currentPlayingIndex)].data);
                                player.play();
                              } else {
                                if (ref.watch(currentPlayingIndex) !=
                                    data.length - 1) {
                                  // add  one in to current playing index
                                  ref
                                          .watch(currentPlayingIndex.notifier)
                                          .state =
                                      ref.read(currentPlayingIndex) + 1;
                                }
                              }
                            },
                            color: Colors.deepPurple,
                          ),
                        ],
                      ),
                    ),
                    bottom: PreferredSize(
                      preferredSize:
                          Size(double.infinity, context.screenHeight(50)),
                      child: ProgressIndicatingWidget(
                        data: data,
                      ),
                    ),
                  ),
                  // mp3 files stored in local storage
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      childCount: data.length,
                      (context, index) => Card(
                        child: PlayListTile(
                          song: data[index],
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
