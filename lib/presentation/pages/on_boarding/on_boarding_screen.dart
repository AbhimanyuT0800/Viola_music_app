import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:music_app/presentation/pages/bottom_navigation/bottom_navigation_page.dart';
import 'package:music_app/presentation/pages/on_boarding/loading_screen/text_field.dart';
import 'package:music_app/utils/dynamic_sizes/dynamic_sizes.dart';
import 'package:page_transition/page_transition.dart';

class OnBoardingScreen extends StatelessWidget {
  OnBoardingScreen({super.key});

  // images for on-boarding pageview
  final List<String> images = [
    'assets/images/img_onboardig_2.png',
    'assets/images/img_onboarding.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
              itemCount: 100,
              itemBuilder: (context, index) {
                final int currentIndex;
                // allow infinit scrolling page page view
                if (index % 2 == 0) {
                  currentIndex = 1;
                } else {
                  currentIndex = 0;
                }
                return Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(images[currentIndex]),
                          fit: BoxFit.cover)),
                );
              }),
          Positioned(
            bottom: 0,
            left: context.screenWidth(23),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: onBoardingText(
                      text: 'Unlock the Soundtrack \nof Your Soul....!'),
                ),
                onBoardingText(
                  text: 'Personalized Playlists Tailored to \nYour Mood.'
                      'Get Started',
                ),
                // onboarding button
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 35),
                  child: InkWell(
                    onTap: () => Navigator.pushReplacement(
                      context,
                      PageTransition(
                          child: const MusicBottomSheet(),
                          type: PageTransitionType.fade),
                    ),
                    child: Container(
                      width: context.screenWidth(350),
                      height: context.screenHeight(70),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        image: const DecorationImage(
                            image:
                                AssetImage('assets/images/Rectangle 1 (1).png'),
                            fit: BoxFit.cover),
                      ),
                      child: Center(
                        child: Text(
                          'Get Started',
                          style: GoogleFonts.lato(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
