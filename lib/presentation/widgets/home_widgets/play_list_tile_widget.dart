import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:music_app/domain/usecase/play_music.dart';
import 'package:on_audio_query/on_audio_query.dart' as model;

class PlayListTile extends StatelessWidget {
  const PlayListTile({
    super.key,
    required this.song,
  });
  final model.SongModel song;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () async {
        log(song.data);
        try {
          await PlayMusicCase().playCurrentntMusic(song);
        } catch (e) {
          log('error::$e');
        }
      },
      leading: const CircleAvatar(
        backgroundImage: AssetImage('assets/images/img_onboarding.jpg'),
      ),
      title: Text(
        song.title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.deepPurple,
        ),
      ),
      subtitle: Text(
        song.uri!,
        style: const TextStyle(
          color: Colors.deepPurpleAccent,
        ),
      ),
      trailing: const Icon(Icons.more_vert, color: Colors.deepPurple),
    );
  }
}
