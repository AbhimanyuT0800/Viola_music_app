import 'package:music_app/presentation/providers/music/get_all_music.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'search.g.dart';

@riverpod
class Search extends _$Search {
  @override
  List<SongModel> build() {
    return [];
  }

  void searchSongs(String search) {
    List<SongModel> data = ref.read(getAllMusicProvider).value ?? [];
    RegExp regExp = RegExp(search, caseSensitive: false);
    state = [
      for (SongModel model in data)
        if (regExp.hasMatch(model.title)) model
    ];
  }
}
