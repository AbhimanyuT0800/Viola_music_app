import 'package:viola/domain/entity/songs_entity.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_music_entity.g.dart';

/// method to find the id(from data base) of fav song
@riverpod
int getMusicEntity(GetMusicEntityRef ref,
    {required String data, required List<SongsEntity> dbSongs}) {
  int id = 0;
  for (SongsEntity entity in dbSongs) {
    if (entity.data == data) {
      id = entity.id!;
      break;
    }
  }
  return id;
}
