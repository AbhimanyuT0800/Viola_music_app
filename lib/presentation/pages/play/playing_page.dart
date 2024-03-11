import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:music_app/presentation/providers/current_playing/is_palying.dart';
import 'package:music_app/presentation/providers/current_playing/music_player_provider.dart';
import 'package:music_app/presentation/providers/music/get_all_music.dart';
import 'package:music_app/presentation/widgets/home_widgets/progress_indicator.dart';
import 'package:music_app/utils/dynamic_sizes/dynamic_sizes.dart';

class CurrentPlayingPage extends ConsumerWidget {
  const CurrentPlayingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // checks if it is playing or not
    bool isPlaying = ref.watch(isPlayingProvider);

    /// Audio player instance
    final AudioPlayer player = ref.read(musicPlayerProvider);

    return ref.read(getAllMusicProvider).when(
        data: (data) {
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
                  Navigator.pop(context);
                },
              ),
            ),
            // builder for checks the index is changing or not
            body: StreamBuilder(
                stream: player.currentIndexStream,
                builder: (context, snapShot) {
                  return Container(
                    decoration: const BoxDecoration(
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
                            data[snapShot.data ?? 0].displayName,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.roboto(
                              fontSize: 30,
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(height: context.screenHeight(15)),
                          Text(
                            data[snapShot.data ?? 0].album ?? 'unknown',
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
                              IconButton(
                                icon: const Icon(Icons.shuffle,
                                    color: Colors.white),
                                onPressed: () {
                                  player.setShuffleModeEnabled(true);
                                },
                              ),
                              SizedBox(width: context.screenWidth(20)),
                              IconButton(
                                icon: const Icon(Icons.skip_previous,
                                    size: 50, color: Colors.white),
                                onPressed: () {
                                  // pause the current song and play the next song
                                  if (player.playing) {
                                    player.seekToPrevious();
                                    player.play();
                                  } else {
                                    //  just seek to next song
                                    player.seekToPrevious();
                                  }
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

                                    player.play();
                                  }
                                },
                              ),
                              SizedBox(width: context.screenWidth(20)),
                              IconButton(
                                icon: const Icon(Icons.skip_next,
                                    size: 50, color: Colors.white),
                                onPressed: () {
                                  if (player.playing) {
                                    // pause current song and play the next song

                                    player.seekToNext();
                                    player.play();
                                  } else {
                                    // just seek to next song
                                    player.seekToNext();
                                  }
                                },
                              ),
                              SizedBox(width: context.screenWidth(20)),
                              IconButton(
                                icon: const Icon(Icons.repeat,
                                    color: Colors.white),
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
          );
        },
        error: (error, stackTrace) => Center(
              child: Text('error:$error'),
            ),
        loading: () => const Center(
              child: CircularProgressIndicator(),
            ));
  }
}
