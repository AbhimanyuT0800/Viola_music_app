import 'package:just_audio/just_audio.dart';
import 'package:on_audio_query/on_audio_query.dart';

class ListOfAllMusic {
  List<AudioSource> getAllPlayList({required List<SongModel> data}) {
    final List<AudioSource> allMusicPlayList = [
      for (SongModel model in data) AudioSource.file(model.data)
    ];
    return allMusicPlayList;
  }
}
