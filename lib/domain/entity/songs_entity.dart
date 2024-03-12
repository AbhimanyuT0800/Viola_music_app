import 'package:objectbox/objectbox.dart';

// entity class for objectBox
@Entity()
class SongsEntity {
  @Id()
  int? id;

  String? title;
  String? artist;

  String data;
  SongsEntity(
      {this.id = 0,
      required this.artist,
      required this.title,
      required this.data});
}
