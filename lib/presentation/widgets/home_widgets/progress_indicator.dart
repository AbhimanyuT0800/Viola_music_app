import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:music_app/utils/dynamic_sizes/dynamic_sizes.dart';
import 'package:on_audio_query/on_audio_query.dart';

class ProgressIndicatingWidget extends StatelessWidget {
  const ProgressIndicatingWidget({super.key, required this.data});
  final List<SongModel> data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: context.screenHeight(30),
          vertical: context.screenHeight(20)),
      child: ProgressBar(
        progress: const Duration(milliseconds: 1000),
        buffered: const Duration(milliseconds: 2000),
        total: const Duration(milliseconds: 5000),
        onSeek: (duration) {},
      ),
    );
  }
}
