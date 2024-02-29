import 'dart:developer';

import 'package:on_audio_query/on_audio_query.dart' as model;

class FetchAudioFiles {
  Future<List<model.SongModel>> fetchAudio() async {
    final model.OnAudioQuery audioQuery = model.OnAudioQuery();
    try {
      List<model.SongModel> songsList = await audioQuery.querySongs(
        sortType: model.SongSortType.TITLE,
        orderType: model.OrderType.ASC_OR_SMALLER,
        uriType: model.UriType.EXTERNAL,
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
