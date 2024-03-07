import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:music_app/presentation/providers/current_playing/music_player_provider.dart';
import 'package:music_app/utils/dynamic_sizes/dynamic_sizes.dart';

// stream builder for progress bar
class ProgressIndicatingWidget extends ConsumerWidget {
  const ProgressIndicatingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Audio player instance
    final AudioPlayer player = ref.read(musicPlayerProvider);

    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: context.screenHeight(30),
          vertical: context.screenHeight(20)),
      child: StreamBuilder(
          // take position stream
          stream: player.positionStream,
          builder: (context, snapShot) {
            return ProgressBar(
              // current position of the
              progress: snapShot.data ?? Duration.zero,
              // finds total duration
              total: ref.watch(musicPlayerProvider).duration ?? Duration.zero,
              onSeek: (duration) {
                // seek to position when manuly changes
                ref.read(musicPlayerProvider).seek(duration);
              },
              baseBarColor: Colors.grey,
              thumbColor: Colors.white,
              progressBarColor: Colors.white,
              timeLabelTextStyle: GoogleFonts.roboto(color: Colors.white),
            );
          }),
    );
  }
}
