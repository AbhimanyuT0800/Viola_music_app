import 'package:objectbox/objectbox.dart';

@Entity()
class SongsEntity {
  @Id()
  int? id;
  int? songId;
  String? uri;
  String? name;
  String? artist;
  String? path;
  SongsEntity(
      {this.id = 0,
      required this.songId,
      required this.uri,
      required this.artist,
      required this.name,
      required this.path});
}
