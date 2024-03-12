import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:music_app/data/repositories/shared_pref_repo_impl/shared_perf_impl.dart';
import 'package:music_app/presentation/pages/bottom_navigation/bottom_navigation_page.dart';
import 'package:music_app/presentation/pages/home/access_denied/storage_access_denied.dart';
import 'package:music_app/presentation/widgets/home_widgets/text_field.dart';
import 'package:music_app/utils/dynamic_sizes/dynamic_sizes.dart';
import 'package:page_transition/page_transition.dart';
import 'package:permission_handler/permission_handler.dart';

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
                    onTap: () async {
                      // ask permission for storage
                      await Permission.storage.request();
                      if (await Permission.storage.isGranted) {
                        // permission is granded set share pref true
                        SharedPrefImpl.setSharedpref(status: true);
                        // then navigate directly to the home page
                        Future.sync(() => Navigator.pushReplacement(
                              context,
                              PageTransition(
                                  child: const MusicBottomSheet(),
                                  type: PageTransitionType.fade),
                            ));
                      } else {
                        // permission not allowed navigate to storageException page
                        Future.sync(() => Navigator.pushReplacement(
                              context,
                              PageTransition(
                                  child: const StorageAccessException(),
                                  type: PageTransitionType.fade),
                            ));
                      }
                    },
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
