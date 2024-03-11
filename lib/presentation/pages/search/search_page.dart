import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchPage extends StatelessWidget {
  SearchPage({super.key, required this.scrollController});

  ///controller for scrolling the bottom navigation bar
  final ScrollController scrollController;

  /// controller for search section
  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: textEditingController,
              onChanged: (value) {
                //
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
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
