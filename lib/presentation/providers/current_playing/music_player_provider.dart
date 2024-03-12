import 'package:just_audio/just_audio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'music_player_provider.g.dart';

// audioPlayer provider
@Riverpod(keepAlive: true)
AudioPlayer musicPlayer(MusicPlayerRef ref) {
  return AudioPlayer();
}
