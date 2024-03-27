import 'package:viola/domain/entity/songs_entity.dart';
import 'package:viola/objectbox.g.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

// object box declaration
class ObjectBoxImpl {
  late final Store store;
  static late final Box<SongsEntity> box;
  ObjectBoxImpl._create(this.store) {
    box = store.box<SongsEntity>();
  }
  static Future<ObjectBoxImpl> create() async {
    final docdir = await getApplicationCacheDirectory();
    final store = await openStore(directory: join(docdir.path, 'music'));
    return ObjectBoxImpl._create(store);
  }
}
