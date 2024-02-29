import 'package:music_app/data/model/songs_entity.dart';
import 'package:music_app/data/repositories/object_box_repo_impl.dart/object_box_impl.dart';
import 'package:on_audio_query/on_audio_query.dart' as model;
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'music_db.g.dart';

@riverpod
class MusicDb extends _$MusicDb {
  @override
  List<SongsEntity> build() {
    return ObjectBoxImpl.box.getAll();
  }

  void addSongs(SongsEntity song) {
    ObjectBoxImpl.box.put(SongsEntity(
        songId: song.songId,
        uri: song.uri,
        artist: song.artist,
        name: song.name,
        path: song.path));
    // state = ObjectBoxImpl.box.getAll();
  }

  getSongs() async {
    final onAudioQuery = model.OnAudioQuery();

    List<model.SongModel> songs = await onAudioQuery.querySongs(
      sortType: null,
      orderType: model.OrderType.ASC_OR_SMALLER,
      uriType: model.UriType.EXTERNAL,
      ignoreCase: true,
    );

    songs.map((e) => ref.watch(musicDbProvider.notifier).addSongs(SongsEntity(
        songId: e.id,
        uri: e.uri,
        artist: e.artist,
        name: e.displayName,
        path: e.fileExtension)));
    // state = ObjectBoxImpl.box.getAll();
  }
}
