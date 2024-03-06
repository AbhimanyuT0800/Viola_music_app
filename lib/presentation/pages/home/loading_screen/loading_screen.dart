import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:music_app/presentation/pages/on_boarding/on_boarding_screen.dart';

import 'package:page_transition/page_transition.dart';
import 'package:permission_handler/permission_handler.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    requestPermission();
  }

  requestPermission() async {
    await Permission.storage.request();
  }

  @override
  Widget build(BuildContext context) {
    // navigate to onboarding screen after delay of 4s
    Future.delayed(const Duration(seconds: 4), () {
      Navigator.pushReplacement(
        context,
        PageTransition(
            child: OnBoardingScreen(), type: PageTransitionType.fade),
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
