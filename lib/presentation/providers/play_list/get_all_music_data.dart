import 'package:just_audio/just_audio.dart';
import 'package:music_app/data/data_source/list_play_list/list_of_all_audio_file.dart';
import 'package:music_app/presentation/providers/music/get_all_music.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_all_music_data.g.dart';

@riverpod
Future<ConcatenatingAudioSource> getAllMusicPlayList(
    GetAllMusicPlayListRef ref) {
  return ListOfAllMusic()
      .getAllPlayList(data: ref.read(getAllMusicProvider).value!);
}
