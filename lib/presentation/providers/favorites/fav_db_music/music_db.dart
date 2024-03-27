import 'package:viola/data/data_source/object_box.dart/object_box_impl.dart';
import 'package:viola/domain/entity/songs_entity.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'music_db.g.dart';

// provide favorite music from objet box
@riverpod
class MusicDb extends _$MusicDb {
  @override
  List<SongsEntity> build() {
    return ObjectBoxImpl.box.getAll();
  }

// method for add songs
  void addSongs(SongsEntity song) {
    ObjectBoxImpl.box.put(song);
    state = ObjectBoxImpl.box.getAll();
  }

// method for remove songs
  void removeSongs(int id) {
    ObjectBoxImpl.box.remove(id);
    state = ObjectBoxImpl.box.getAll();
  }
}
