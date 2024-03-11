// GENERATED CODE - DO NOT MODIFY BY HAND
// This code was generated by ObjectBox. To update it run the generator again:
// With a Flutter package, run `flutter pub run build_runner build`.
// With a Dart package, run `dart run build_runner build`.
// See also https://docs.objectbox.io/getting-started#generate-objectbox-code

// ignore_for_file: camel_case_types, depend_on_referenced_packages
// coverage:ignore-file

import 'dart:typed_data';

import 'package:flat_buffers/flat_buffers.dart' as fb;
import 'package:objectbox/internal.dart'
    as obx_int; // generated code can access "internal" functionality
import 'package:objectbox/objectbox.dart' as obx;
import 'package:objectbox_flutter_libs/objectbox_flutter_libs.dart';

import 'domain/entity/songs_entity.dart';

export 'package:objectbox/objectbox.dart'; // so that callers only have to import this file

final _entities = <obx_int.ModelEntity>[
  obx_int.ModelEntity(
      id: const obx_int.IdUid(1, 4936908775695531646),
      name: 'SongsEntity',
      lastPropertyId: const obx_int.IdUid(8, 2794371000411286597),
      flags: 0,
      properties: <obx_int.ModelProperty>[
        obx_int.ModelProperty(
            id: const obx_int.IdUid(1, 3274363104941198466),
            name: 'id',
            type: 6,
            flags: 1),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(5, 1547261702909263532),
            name: 'artist',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(7, 3325498367957140990),
            name: 'title',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(8, 2794371000411286597),
            name: 'data',
            type: 9,
            flags: 0)
      ],
      relations: <obx_int.ModelRelation>[],
      backlinks: <obx_int.ModelBacklink>[])
];

/// Shortcut for [Store.new] that passes [getObjectBoxModel] and for Flutter
/// apps by default a [directory] using `defaultStoreDirectory()` from the
/// ObjectBox Flutter library.
///
/// Note: for desktop apps it is recommended to specify a unique [directory].
///
/// See [Store.new] for an explanation of all parameters.
///
/// For Flutter apps, also calls `loadObjectBoxLibraryAndroidCompat()` from
/// the ObjectBox Flutter library to fix loading the native ObjectBox library
/// on Android 6 and older.
Future<obx.Store> openStore(
    {String? directory,
    int? maxDBSizeInKB,
    int? maxDataSizeInKB,
    int? fileMode,
    int? maxReaders,
    bool queriesCaseSensitiveDefault = true,
    String? macosApplicationGroup}) async {
  await loadObjectBoxLibraryAndroidCompat();
  return obx.Store(getObjectBoxModel(),
      directory: directory ?? (await defaultStoreDirectory()).path,
      maxDBSizeInKB: maxDBSizeInKB,
      maxDataSizeInKB: maxDataSizeInKB,
      fileMode: fileMode,
      maxReaders: maxReaders,
      queriesCaseSensitiveDefault: queriesCaseSensitiveDefault,
      macosApplicationGroup: macosApplicationGroup);
}

/// Returns the ObjectBox model definition for this project for use with
/// [Store.new].
obx_int.ModelDefinition getObjectBoxModel() {
  final model = obx_int.ModelInfo(
      entities: _entities,
      lastEntityId: const obx_int.IdUid(1, 4936908775695531646),
      lastIndexId: const obx_int.IdUid(0, 0),
      lastRelationId: const obx_int.IdUid(0, 0),
      lastSequenceId: const obx_int.IdUid(0, 0),
      retiredEntityUids: const [],
      retiredIndexUids: const [],
      retiredPropertyUids: const [
        1267954315694041181,
        8626951066153139958,
        9171800041686754558,
        8704805100313453937
      ],
      retiredRelationUids: const [],
      modelVersion: 5,
      modelVersionParserMinimum: 5,
      version: 1);

  final bindings = <Type, obx_int.EntityDefinition>{
    SongsEntity: obx_int.EntityDefinition<SongsEntity>(
        model: _entities[0],
        toOneRelations: (SongsEntity object) => [],
        toManyRelations: (SongsEntity object) => {},
        getId: (SongsEntity object) => object.id,
        setId: (SongsEntity object, int id) {
          object.id = id;
        },
        objectToFB: (SongsEntity object, fb.Builder fbb) {
          final artistOffset =
              object.artist == null ? null : fbb.writeString(object.artist!);
          final titleOffset =
              object.title == null ? null : fbb.writeString(object.title!);
          final dataOffset =
              object.data == null ? null : fbb.writeString(object.data!);
          fbb.startTable(9);
          fbb.addInt64(0, object.id ?? 0);
          fbb.addOffset(4, artistOffset);
          fbb.addOffset(6, titleOffset);
          fbb.addOffset(7, dataOffset);
          fbb.finish(fbb.endTable());
          return object.id ?? 0;
        },
        objectFromFB: (obx.Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);
          final idParam =
              const fb.Int64Reader().vTableGetNullable(buffer, rootOffset, 4);
          final artistParam = const fb.StringReader(asciiOptimization: true)
              .vTableGetNullable(buffer, rootOffset, 12);
          final titleParam = const fb.StringReader(asciiOptimization: true)
              .vTableGetNullable(buffer, rootOffset, 16);
          final dataParam = const fb.StringReader(asciiOptimization: true)
              .vTableGetNullable(buffer, rootOffset, 18);
          final object = SongsEntity(
              id: idParam,
              artist: artistParam,
              title: titleParam,
              data: dataParam);

          return object;
        })
  };

  return obx_int.ModelDefinition(model, bindings);
}

/// [SongsEntity] entity fields to define ObjectBox queries.
class SongsEntity_ {
  /// see [SongsEntity.id]
  static final id =
      obx.QueryIntegerProperty<SongsEntity>(_entities[0].properties[0]);

  /// see [SongsEntity.artist]
  static final artist =
      obx.QueryStringProperty<SongsEntity>(_entities[0].properties[1]);

  /// see [SongsEntity.title]
  static final title =
      obx.QueryStringProperty<SongsEntity>(_entities[0].properties[2]);

  /// see [SongsEntity.data]
  static final data =
      obx.QueryStringProperty<SongsEntity>(_entities[0].properties[3]);
}
