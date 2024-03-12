import 'dart:developer';

import 'package:on_audio_query/on_audio_query.dart';

// get all audio files from local storage

class FetchAudioFiles {
  Future<List<SongModel>> fetchAudio() async {
    final OnAudioQuery audioQuery = OnAudioQuery();
    try {
      List<SongModel> songsList = await audioQuery.querySongs(
        sortType: SongSortType.TITLE,
        orderType: OrderType.ASC_OR_SMALLER,
        uriType: UriType.EXTERNAL,
        ignoreCase: true,
      );
      log(songsList.length.toString());
      return songsList;
    } catch (e) {
      log(e.toString());
      return [];
    }
  }
}
