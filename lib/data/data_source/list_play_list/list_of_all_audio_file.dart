import 'package:just_audio/just_audio.dart';
import 'package:on_audio_query/on_audio_query.dart';

class ListOfAllMusic {
  Future<ConcatenatingAudioSource> getAllPlayList(
      {required List<SongModel> data}) async {
    final allMusicPlayList = ConcatenatingAudioSource(children: [
      for (SongModel model in data)
        ConcatenatingAudioSource(children: [AudioSource.file(model.data)])
    ]);
    return allMusicPlayList;
  }
}
