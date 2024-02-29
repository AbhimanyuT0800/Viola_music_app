import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:music_app/presentation/pages/play_list/shuffle_page.dart';
import 'package:music_app/presentation/pages/play_list/songs_in_list.dart';
import 'package:music_app/utils/dynamic_sizes/dynamic_sizes.dart';

class PlayListPage extends StatelessWidget {
  const PlayListPage({Key? key, required this.scrollController})
      : super(key: key);
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Column(
          children: [
            Container(
              width: double.infinity,
              height: context.screenHeight(1004),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [Colors.deepPurple, Colors.deepPurple[300]!])),
              child: Padding(
                padding: EdgeInsets.only(top: context.screenHeight(70)),
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Playlists',
                        style: GoogleFonts.roboto(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 20),
                      ),
                      SizedBox(
                        height: context.screenHeight(50),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(bottom: context.screenHeight(20)),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.amber,
                              borderRadius: BorderRadius.circular(20),
                              image: const DecorationImage(
                                  image: AssetImage(
                                      'assets/images/img_onboardig_2.png'),
                                  fit: BoxFit.cover)),
                          width: context.screenWidth(300),
                          height: context.screenHeight(300),
                        ),
                      ),
                      SizedBox(
                        height: context.screenHeight(100),
                        child: TabBar(
                          indicator: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          indicatorPadding: EdgeInsets.zero,
                          indicatorWeight: 2,
                          tabs: [
                            Tab(
                              icon: Container(
                                width: context.screenWidth(300),
                                height: context.screenHeight(50),
                                decoration: const BoxDecoration(
                                    color: Colors.transparent),
                                child: const Icon(
                                  Icons.queue_music_outlined,
                                  size: 30,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            Tab(
                              icon: Container(
                                width: 100,
                                height: 50,
                                decoration: const BoxDecoration(
                                    color: Colors.transparent),
                                child: const Icon(
                                  Icons.shuffle,
                                  size: 30,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            const Expanded(
              child: TabBarView(
                children: [ShufflePage(), SongsInList()],
              ),
            )
          ],
        ),
      ),
    );
  }
}
