import 'package:just_audio/just_audio.dart';
import 'package:music_app/data/data_source/list_play_list/list_of_all_audio_file.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_all_music_data.g.dart';

@riverpod
List<AudioSource> getAllMusicPlayList(GetAllMusicPlayListRef ref,
    {required List<SongModel> data}) {
  return ListOfAllMusic().getAllPlayList(data: data);
}
