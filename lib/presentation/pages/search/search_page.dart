import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:viola/presentation/providers/search_provider/search.dart';
import 'package:viola/presentation/widgets/home_widgets/play_list_tile_widget.dart';
import 'package:viola/utils/dynamic_sizes/dynamic_sizes.dart';
import 'package:on_audio_query/on_audio_query.dart';

class SearchPage extends ConsumerWidget {
  SearchPage({super.key, required this.scrollController});

  ///controller for scrolling the bottom navigation bar
  final ScrollController scrollController;

  /// controller for search section
  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.deepPurple,
        // title
        title: Text(
          'Search',
          style: GoogleFonts.pacifico(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              letterSpacing: 2),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: textEditingController,
                onChanged: (value) {
                  // Provider for getting searched songs
                  ref.read(searchProvider.notifier).searchSongs(search: value);
                },
                decoration: InputDecoration(
                  hintText: 'Search...',
                  // Background color
                  fillColor: Colors.grey[200],
                  filled: true,
                  contentPadding: EdgeInsets.symmetric(
                      vertical: context.screenHeight(10),
                      horizontal: context.screenHeight(20)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: BorderSide.none,
                  ),
                  suffixIcon: IconButton(
                    // when somthing type to search icon will change to clear the text
                    icon: textEditingController.text.isEmpty
                        ? const Icon(Icons.search)
                        : const Icon(Icons.close),
                    onPressed: () {
                      // clear textediting controller
                      textEditingController.clear();
                      ref.invalidate(searchProvider);
                    },
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: context.screenHeight(5)),
              child: ref.watch(searchProvider).isEmpty
                  ? Padding(
                      padding: EdgeInsets.only(top: context.screenHeight(150)),
                      child: SizedBox(
                        height: context.screenHeight(300),
                        width: context.screenHeight(300),
                        child: const Image(
                            image: AssetImage(
                                'assets/images/search_somthing.webp')),
                      ),
                    )
                  : SizedBox(
                      height: context.screenHeight(780),
                      child: ListView.builder(
                        shrinkWrap: true,
                        // length of the result of search
                        itemCount: ref.watch(searchProvider).length,
                        controller: scrollController,
                        itemBuilder: (context, index) {
                          // get all result
                          final List<SongModel> result =
                              ref.watch(searchProvider);
                          return PlayListTile(
                            title: result[index].title,
                            artist: result[index].artist ?? 'unknown',
                            data: result[index].data,
                            index: index,
                            isPlayingFromSearch: true,
                            // make list of string with search results data
                            listOfDatas: result.map((e) => e.data).toList(),
                          );
                        },
                      ),
                    ),
            )
          ],
        ),
      ),
    );
  }
}
