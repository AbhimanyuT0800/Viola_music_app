import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';

// get necessary list of audioSource
class ListOfAllMusic {
  List<AudioSource> getAllPlayList({required List<String> data}) {
    final List<AudioSource> allMusicPlayList = [
      for (String model in data)
        AudioSource.file(model,
            tag: const MediaItem(id: '1', title: 'unknown', artist: 'unknown'))
    ];
    return allMusicPlayList;
  }
}
