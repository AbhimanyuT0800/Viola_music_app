import 'package:flutter/material.dart';
import 'package:music_app/presentation/pages/favorite/favorites_page.dart';
import 'package:music_app/presentation/pages/home/home_page.dart';
import 'package:music_app/presentation/pages/search/search_page.dart';
import 'package:music_app/utils/dynamic_sizes/dynamic_sizes.dart';
import 'package:scroll_to_hide/scroll_to_hide.dart';

class MusicBottomSheet extends StatefulWidget {
  const MusicBottomSheet({super.key});

  @override
  State<MusicBottomSheet> createState() => _MusicBottomSheetState();
}

class _MusicBottomSheetState extends State<MusicBottomSheet> {
  // scroll controller for scrollToHide package
  final ScrollController _scrollController = ScrollController();

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    // pages for navigate throw
    List<Widget> pages = [
      HomePage(scrollController: _scrollController),
      SearchPage(scrollController: _scrollController),
      FavoritePage(controller: _scrollController)
    ];
    return Scaffold(
      body: Stack(
        children: [
          // shows selected page
          pages[currentIndex],
          // scroll to hide methods
          Positioned(
            left: context.screenWidth(35),
            right: context.screenWidth(35),
            bottom: context.screenHeight(-10),
            child: ScrollToHide(
              height: 90,
              duration: const Duration(milliseconds: 500),
              scrollController: _scrollController,
              hideDirection: Axis.vertical,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: BottomNavigationBar(
                  currentIndex: currentIndex,
                  showUnselectedLabels: false,
                  selectedLabelStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w700),
                  onTap: (value) {
                    // update current index according to tap
                    setState(() {
                      currentIndex = value;
                    });
                  },
                  backgroundColor: Colors.deepPurple[300],
                  selectedItemColor: Colors.white,
                  unselectedItemColor: Colors.grey[400],
                  elevation: 10,
                  iconSize: 28,
                  selectedFontSize: 14,
                  unselectedFontSize: 12,
                  items: const [
                    // items for bottom navigation bar
                    BottomNavigationBarItem(
                      icon: Icon(
                        Icons.home,
                      ),
                      label: 'Home',
                    ),
                    BottomNavigationBarItem(
                        icon: Icon(
                          Icons.search,
                        ),
                        label: 'Search'),
                    BottomNavigationBarItem(
                        icon: Icon(
                          Icons.favorite,
                        ),
                        label: 'Playlist')
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
