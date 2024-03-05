import 'package:music_app/domain/usecase/fetch_all_music_case.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_all_music.g.dart';

@riverpod
Future<List<SongModel>> getAllMusic(GetAllMusicRef ref) {
  return FetchAudioFiles().fetchAudio();
}
