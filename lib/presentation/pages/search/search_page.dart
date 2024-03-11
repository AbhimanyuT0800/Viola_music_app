import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:music_app/presentation/providers/search_provider/search.dart';
import 'package:music_app/presentation/widgets/home_widgets/play_list_tile_widget.dart';
import 'package:music_app/utils/dynamic_sizes/dynamic_sizes.dart';
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
        title: Text(
          'Search',
          style: GoogleFonts.roboto(
              color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: textEditingController,
                onChanged: (value) {
                  ref.read(searchProvider.notifier).searchSongs(search: value);
                },
                decoration: InputDecoration(
                  hintText: 'Search...',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () {
                      // Implement search functionality
                      // ref
                      //     .read(searchProvider.notifier)
                      //     .searchSongs(search: );
                    },
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: context.screenHeight(5)),
              child: ref.watch(searchProvider).isEmpty
                  ? const Center(
                      child: Text('search......!'),
                    )
                  : ListView.builder(
                      shrinkWrap: true,
                      itemCount: ref.watch(searchProvider).length,
                      controller: scrollController,
                      itemBuilder: (context, index) {
                        final List<SongModel> result =
                            ref.watch(searchProvider);
                        return PlayListTile(
                            title: result[index].title,
                            artist: result[index].artist ?? 'unknown',
                            data: result[index].data,
                            index: index,
                            isPlayingFromFav: false);
                      },
                    ),
            )
          ],
        ),
      ),
    );
  }
}
