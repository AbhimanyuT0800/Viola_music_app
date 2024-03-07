import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:music_app/presentation/providers/current_playing/music_player_provider.dart';
import 'package:music_app/presentation/widgets/home_widgets/buttons_home_song_controllers/skip_previos.dart';
import 'package:music_app/presentation/widgets/home_widgets/progress_indicator.dart';
import 'package:music_app/utils/dynamic_sizes/dynamic_sizes.dart';

class CurrentPlayingPage extends ConsumerWidget {
  const CurrentPlayingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
      body: Container(
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
                'Song Title',
                style: GoogleFonts.roboto(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: context.screenHeight(15)),
              Text(
                'Artist Name',
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
                    icon: const Icon(Icons.shuffle, color: Colors.white),
                    onPressed: () {
                      // Implement shuffle logic
                    },
                  ),
                  SizedBox(width: context.screenWidth(20)),
                  IconButton(
                    icon: const Icon(Icons.skip_previous,
                        size: 50, color: Colors.white),
                    onPressed: () {
                      // Implement skip to previous logic
                    },
                  ),
                  SizedBox(width: context.screenWidth(20)),
                  IconButton(
                    icon: const Icon(Icons.play_arrow,
                        color: Colors.white, size: 60),
                    onPressed: () {
                      // Implement play/pause logic
                    },
                  ),
                  SizedBox(width: context.screenWidth(20)),
                  IconButton(
                    icon: const Icon(Icons.skip_next,
                        size: 50, color: Colors.white),
                    onPressed: () {
                      // Implement skip to next logic
                    },
                  ),
                  SizedBox(width: context.screenWidth(20)),
                  IconButton(
                    icon: const Icon(Icons.repeat, color: Colors.white),
                    onPressed: () {
                      // Implement repeat logic
                    },
                  ),
                ],
              ),
              SizedBox(height: context.screenHeight(20)),
            ],
          ),
        ),
      ),
    );
  }
}
