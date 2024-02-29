import 'package:flutter/material.dart';
import 'package:music_app/utils/dynamic_sizes/dynamic_sizes.dart';

class SearchPage extends StatelessWidget {
  SearchPage({super.key, required this.scrollController});
  final ScrollController scrollController;
  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: context.screenWidth(10),
                  top: context.screenHeight(30),
                  right: context.screenWidth(50)),
              child: TextField(
                controller: textEditingController,
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: context.screenWidth(20)),
                  hintText: 'Search...',
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () {
                      //
                    },
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
