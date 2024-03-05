import 'package:music_app/domain/usecase/play_music.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'playing_and_pause_parovider.g.dart';

// provider for playing music
@riverpod
Future<void> playMusic(PlayMusicRef ref, SongModel model) {
  return ref.read(playMusicCaseProvider).playCurrentMusic(model);
}

// provider for pause music
@riverpod
Future<void> pauseMusic(PauseMusicRef ref, SongModel model) {
  return ref.read(playMusicCaseProvider).pauseCurrentMusic(model);
}

// provider for current state

