import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:music_app/data/model/songs_entity.dart';
import 'package:music_app/presentation/providers/db_music/music_db.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// part 'is_favorites.g.dart';

// @riverpod
// bool isFav(IsFavRef ref, {required String data}) {
//   bool isFav = false;
//   List<SongsEntity> listOfmusic = ref.read(musicDbProvider);
//   for (SongsEntity model in listOfmusic) {
//     if (model.data == data) {
//       isFav = true;
//       break;
//     }
//   }
//   return isFav;
// }

final isFavProvider = StateProvider<bool>((ref) => false);
