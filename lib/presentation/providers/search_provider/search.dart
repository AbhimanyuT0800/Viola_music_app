import 'package:music_app/domain/usecase/fetch_all_music_case.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'search.g.dart';

// returns list of songs when searchs
@riverpod
class Search extends _$Search {
  @override
  List<SongModel> build() {
    return [];
  }

  void searchSongs({required String search}) async {
    List<SongModel> data = await FetchAudioFiles().fetchAudio();
    if (search.isNotEmpty) {
      RegExp regExp = RegExp(search, caseSensitive: false);
      state = [
        for (SongModel model in data)
          if (regExp.hasMatch(model.title)) model
      ];
    } else {
      /// when searchcontroller is empty the state make empty
      state = [];
    }
  }
}
