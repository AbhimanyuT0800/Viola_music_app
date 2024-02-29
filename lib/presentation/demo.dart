import 'package:flutter/material.dart';
import 'package:music_app/domain/usecase/fetch_all_music_case.dart';

class DemoPage extends StatelessWidget {
  const DemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: FetchAudioFiles().fetchAudio(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data!.length,
                shrinkWrap: true,
                itemBuilder: (context, index) => ListTile(
                      title: Text(snapshot.data![index].title),
                    ));
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('sdf'),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
    // return Scaffold(
    //   body: Center(
    //     child: Text('data'),
    //   ),
    // );
  }
}
