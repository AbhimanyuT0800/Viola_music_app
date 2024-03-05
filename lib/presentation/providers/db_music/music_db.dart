import 'package:music_app/data/data_source/object_box_repo_impl.dart/object_box_impl.dart';
import 'package:music_app/data/model/songs_entity.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'music_db.g.dart';

@riverpod
class MusicDb extends _$MusicDb {
  @override
  List<SongsEntity> build() {
    return ObjectBoxImpl.box.getAll();
  }

  void addSongs(SongsEntity song) {
    ObjectBoxImpl.box.put(song);
    state = ObjectBoxImpl.box.getAll();
  }
}
