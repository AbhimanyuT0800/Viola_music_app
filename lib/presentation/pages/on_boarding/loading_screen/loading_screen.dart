import 'package:flutter/material.dart';
import 'package:viola/data/data_source/shared_preferences/shared_perf.dart';
import 'package:viola/presentation/pages/bottom_navigation/bottom_navigation_page.dart';
import 'package:viola/presentation/pages/on_boarding/on_boarding_screen.dart';

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/animations/viola_logo.png",
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
            const Text(
              'Viola',
              style: TextStyle(
                  fontFamily: 'Pacifico',
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.w700),
            )
          ],
        ),
      ),
    );
  }
}
