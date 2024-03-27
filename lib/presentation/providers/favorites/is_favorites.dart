import 'package:viola/domain/entity/songs_entity.dart';
import 'package:viola/presentation/providers/favorites/fav_db_music/music_db.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'is_favorites.g.dart';

// checks it is favorite or not
class CheckIsFav {
  bool isFav({required String data, required List<SongsEntity> listOfmusic}) {
    bool isFav = false;

    for (SongsEntity model in listOfmusic) {
      if (model.data == data) {
        isFav = true;
        break;
      }
    }
    return isFav;
  }
}

@riverpod
bool isFav(IsFavRef ref, {required String data}) {
  return CheckIsFav().isFav(data: data, listOfmusic: ref.read(musicDbProvider));
}
