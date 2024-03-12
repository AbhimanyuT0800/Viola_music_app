import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:music_app/data/data_source/shared_preferences/shared_perf.dart';
import 'package:music_app/presentation/pages/bottom_navigation/bottom_navigation_page.dart';
import 'package:music_app/presentation/pages/on_boarding/on_boarding_screen.dart';

import 'package:page_transition/page_transition.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // navigate to onboarding screen after delay of 4s
    Future.delayed(const Duration(seconds: 4), () {
      Navigator.pushReplacement(
        context,
        PageTransition(
            // if storage access already granded navigate to home screen directly
            // else navigate to onBoarding screen
            child: SharedPrefImpl.getSharedPref()
                ? const MusicBottomSheet()
                : OnBoardingScreen(),
            type: PageTransitionType.fade),
      );
    });

    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 150,
          child: Lottie.asset('assets/animations/loading_animation.json'),
        ),
      ),
    );
  }
}
