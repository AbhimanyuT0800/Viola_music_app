import 'package:just_audio/just_audio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'music_player_provider.g.dart';

@riverpod
class MusicPlayer extends _$MusicPlayer {
  @override
  AudioPlayer build() {
    return AudioPlayer();
  }
}
