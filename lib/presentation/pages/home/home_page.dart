import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:music_app/domain/usecase/fetch_all_music_case.dart';
import 'package:music_app/presentation/providers/music/music_provider.dart';
import 'package:music_app/presentation/widgets/home_widgets/play_list_tile_widget.dart';
import 'package:on_audio_query/on_audio_query.dart' as model;

class HomePage extends ConsumerWidget {
  final ScrollController scrollController;
  HomePage({
    super.key,
    required this.scrollController,
  });

  final Future<List<model.SongModel>> allSongs = FetchAudioFiles().fetchAudio();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return RefreshIndicator(
      onRefresh: () async {
        // delay for refresh indicator showing
        return Future.delayed(const Duration(seconds: 2));
      },
      child: ref.watch(musicProvider).when(
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
                      'Music',
                      style: GoogleFonts.roboto(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Container(
                      padding: const EdgeInsets.all(16.0),
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.deepPurple, Colors.deepPurpleAccent],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Now Playing',
                            style: TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 10.0),
                          CircleAvatar(
                            radius: 80.0,
                            backgroundImage:
                                AssetImage('assets/images/img_onboardig_2.png'),
                          ),
                          SizedBox(height: 10.0),
                          Text(
                            'Song Title',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            'Artist Name',
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.white70,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SliverAppBar(
                    pinned: true,
                    title: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.skip_previous),
                            onPressed: () {},
                            color: Colors.deepPurple,
                          ),
                          IconButton(
                            icon: const Icon(Icons.play_arrow),
                            onPressed: () {
                              // SharedPrefImpl().setSharedpref(
                              //     status: !ref.watch(isPlayingProvider));
                            },
                            color: Colors.deepPurple,
                            iconSize: 48.0,
                          ),
                          IconButton(
                            icon: const Icon(Icons.skip_next),
                            onPressed: () {},
                            color: Colors.deepPurple,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      childCount: data.length,
                      (context, index) => Card(
                        child: PlayListTile(
                          song: data[index],
                        ),
                      ),
                    ),
                  )
                ],
              );
            },
            error: (error, stackTrace) => Center(
              child: Text(stackTrace.toString()),
            ),
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
          ),
    );
  }
}
