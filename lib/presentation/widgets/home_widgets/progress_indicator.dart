import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:music_app/presentation/providers/current_playing/music_player_provider.dart';
import 'package:music_app/utils/dynamic_sizes/dynamic_sizes.dart';
import 'package:on_audio_query/on_audio_query.dart';

class ProgressIndicatingWidget extends ConsumerWidget {
  const ProgressIndicatingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: context.screenHeight(30),
          vertical: context.screenHeight(20)),
      child: StreamBuilder(
          stream: ref.watch(musicPlayerProvider).positionStream,
          builder: (context, snapShot) {
            return ProgressBar(
              progress: snapShot.data ?? Duration.zero,
              total: ref.watch(musicPlayerProvider).duration ?? Duration.zero,
              onSeek: (duration) {
                ref.read(musicPlayerProvider).seek(duration);
              },
            );
          }),
    );
  }
}
