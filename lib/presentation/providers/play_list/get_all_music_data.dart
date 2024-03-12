import 'package:just_audio/just_audio.dart';
import 'package:music_app/data/data_source/list_play_list/list_of_all_audio_file.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_all_music_data.g.dart';

// provider for get necessary list of audioSource
@riverpod
List<AudioSource> getMusicPlayList(GetMusicPlayListRef ref,
    {required List<String> data}) {
  return ListOfAllMusic().getAllPlayList(data: data);
}
