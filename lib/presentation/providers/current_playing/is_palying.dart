import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:music_app/presentation/providers/current_playing/music_player_provider.dart';

// check is playing or not

final isPlayingProvider =
    StateProvider<bool>((ref) => ref.read(musicPlayerProvider).playing);

// current playing index of song
final currentPlayingIndex = StateProvider<int>((ref) => 0);
