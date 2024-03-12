import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:music_app/presentation/providers/current_playing/is_palying.dart';
import 'package:music_app/presentation/providers/current_playing/music_player_provider.dart';
import 'package:music_app/presentation/providers/favorites/fav_db_music/music_db.dart';
import 'package:music_app/presentation/providers/music/get_all_music.dart';
import 'package:music_app/presentation/providers/search_provider/search.dart';
import 'package:music_app/presentation/widgets/home_widgets/progress_indicator.dart';
import 'package:music_app/utils/dynamic_sizes/dynamic_sizes.dart';

class CurrentPlayingPage extends ConsumerWidget {
  const CurrentPlayingPage(
      {super.key,
      this.isPlayingFromFav = false,
      this.isPlayingFromSearch = false});
  final bool isPlayingFromFav;
  final bool isPlayingFromSearch;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // checks if it is playing or not
    bool isPlaying = ref.watch(isPlayingProvider);
    late List<dynamic> data;
    if (isPlayingFromFav) {
      // get list<songsEntity > from objectbox
      data = ref.read(musicDbProvider);
    } else if (isPlayingFromSearch) {
      // get  all searched result in model of songmodel
      data = ref.read(searchProvider);
    } else {
      //get all available audio from local
      data = ref.read(getAllMusicProvider).value!;
    }

    return Scaffold(
      backgroundColor: const Color(0xFF290392),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Now Playing',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            // back arrow
            Navigator.pop(context);
          },
        ),
      ),
      // builder for checks the index is changing or not
      body: SingleChildScrollView(
        child: StreamBuilder(
            stream: ref.watch(musicPlayerProvider).currentIndexStream,
            builder: (context, snapShot) {
              return Container(
                decoration: const BoxDecoration(
                  // greadint for background
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFF673AB7),
                      Color(0xFF290392),
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 20),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          'assets/images/img_onboarding.jpg',
                          fit: BoxFit.cover,
                          width: MediaQuery.of(context).size.width * 0.7,
                          height: MediaQuery.of(context).size.width * 0.7,
                        ),
                      ),
                      SizedBox(height: context.screenHeight(20)),
                      Text(
                        // title
                        data[snapShot.data ?? 0].title,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.roboto(
                          fontSize: 30,
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: context.screenHeight(15)),
                      Text(
                        // subtitle artist name
                        data[snapShot.data ?? 0].artist ?? '',
                        style: GoogleFonts.roboto(
                          fontSize: 20,
                          color: Colors.white.withOpacity(0.8),
                        ),
                      ),
                      SizedBox(height: context.screenHeight(100)),
                      const ProgressIndicatingWidget(),
                      SizedBox(height: context.screenHeight(0)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // button for shuffle
                          IconButton(
                            icon:
                                const Icon(Icons.shuffle, color: Colors.white),
                            onPressed: () {
                              // method for shuffle
                              ref
                                  .read(musicPlayerProvider)
                                  .setShuffleModeEnabled(true);
                            },
                          ),
                          SizedBox(width: context.screenWidth(20)),
                          IconButton(
                            icon: const Icon(Icons.skip_previous,
                                size: 50, color: Colors.white),
                            onPressed: () {
                              // pause the current song and play the next song
                              ref.read(musicPlayerProvider).seekToNext();
                            },
                          ),
                          SizedBox(width: context.screenWidth(20)),
                          IconButton(
                            icon: isPlaying
                                ? const Icon(Icons.pause,
                                    color: Colors.white, size: 60)
                                : const Icon(Icons.play_arrow,
                                    color: Colors.white, size: 60),
                            onPressed: () {
                              if (ref.watch(isPlayingProvider)) {
                                // change isPlaying provider
                                ref.invalidate(isPlayingProvider);
                                // pause current song if itis playing
                                ref.read(musicPlayerProvider).pause();
                              } else {
                                // change isPlaying provider
                                ref.invalidate(isPlayingProvider);

                                ref.read(musicPlayerProvider).play();
                              }
                            },
                          ),
                          SizedBox(width: context.screenWidth(20)),
                          // button for seek to next
                          IconButton(
                            icon: const Icon(Icons.skip_next,
                                size: 50, color: Colors.white),
                            onPressed: () {
                              // method for seek to next
                              ref.read(musicPlayerProvider).seekToNext();
                            },
                          ),
                          SizedBox(width: context.screenWidth(20)),
                          // button for loop mode
                          IconButton(
                            icon: const Icon(Icons.repeat, color: Colors.white),
                            onPressed: () {
                              // loop just once
                              // TODO
                              // player.setLoopMode(LoopMode.one);
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: context.screenHeight(20)),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
