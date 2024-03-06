import 'package:flutter/material.dart';
import 'package:on_audio_query/on_audio_query.dart';

Container currentPlayingMusic(SongModel song) {
  return Container(
    padding: const EdgeInsets.all(16.0),
    decoration: const BoxDecoration(
      gradient: LinearGradient(
        colors: [
          Colors.deepPurple,
          Colors.deepPurpleAccent,
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          'Now Playing',
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 10.0),
        const CircleAvatar(
          radius: 80.0,
          backgroundImage: AssetImage('assets/images/img_onboardig_2.png'),
        ),
        const SizedBox(height: 10.0),
        Text(
          song.displayName,
          style: const TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        Text(
          song.artist ?? 'unknown',
          style: const TextStyle(
            fontSize: 18.0,
            color: Colors.white70,
          ),
        ),
      ],
    ),
  );
}
