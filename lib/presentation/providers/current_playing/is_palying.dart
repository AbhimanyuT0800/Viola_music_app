import 'package:flutter_riverpod/flutter_riverpod.dart';

// check is playing or not

final isPlayingProvider = StateProvider<bool>((ref) => false);

// current playing index of song
final currentPlayingIndex = StateProvider<int>((ref) => 0);
