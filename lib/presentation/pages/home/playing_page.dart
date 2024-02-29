import 'package:flutter/material.dart';

class MusicPlayingPage extends StatelessWidget {
  const MusicPlayingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
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
            backgroundImage: AssetImage('assets/images/img_onboardig_2.png'),
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
    ));
  }
}
