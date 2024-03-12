// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_music_entity.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getMusicEntityHash() => r'6aba8da2f1fccad130801e32b91e4d0a6ca46cc7';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// method to find the id(from data base) of fav song
///
/// Copied from [getMusicEntity].
@ProviderFor(getMusicEntity)
const getMusicEntityProvider = GetMusicEntityFamily();

/// method to find the id(from data base) of fav song
///
/// Copied from [getMusicEntity].
class GetMusicEntityFamily extends Family<int> {
  /// method to find the id(from data base) of fav song
  ///
  /// Copied from [getMusicEntity].
  const GetMusicEntityFamily();

  /// method to find the id(from data base) of fav song
  ///
  /// Copied from [getMusicEntity].
  GetMusicEntityProvider call({
    required String data,
    required List<SongsEntity> dbSongs,
  }) {
    return GetMusicEntityProvider(
      data: data,
      dbSongs: dbSongs,
    );
  }

  @override
  GetMusicEntityProvider getProviderOverride(
    covariant GetMusicEntityProvider provider,
  ) {
    return call(
      data: provider.data,
      dbSongs: provider.dbSongs,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'getMusicEntityProvider';
}

/// method to find the id(from data base) of fav song
///
/// Copied from [getMusicEntity].
class GetMusicEntityProvider extends AutoDisposeProvider<int> {
  /// method to find the id(from data base) of fav song
  ///
  /// Copied from [getMusicEntity].
  GetMusicEntityProvider({
    required String data,
    required List<SongsEntity> dbSongs,
  }) : this._internal(
          (ref) => getMusicEntity(
            ref as GetMusicEntityRef,
            data: data,
            dbSongs: dbSongs,
          ),
          from: getMusicEntityProvider,
          name: r'getMusicEntityProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getMusicEntityHash,
          dependencies: GetMusicEntityFamily._dependencies,
          allTransitiveDependencies:
              GetMusicEntityFamily._allTransitiveDependencies,
          data: data,
          dbSongs: dbSongs,
        );

  GetMusicEntityProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.data,
    required this.dbSongs,
  }) : super.internal();

  final String data;
  final List<SongsEntity> dbSongs;

  @override
  Override overrideWith(
    int Function(GetMusicEntityRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetMusicEntityProvider._internal(
        (ref) => create(ref as GetMusicEntityRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        data: data,
        dbSongs: dbSongs,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<int> createElement() {
    return _GetMusicEntityProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetMusicEntityProvider &&
        other.data == data &&
        other.dbSongs == dbSongs;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, data.hashCode);
    hash = _SystemHash.combine(hash, dbSongs.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetMusicEntityRef on AutoDisposeProviderRef<int> {
  /// The parameter `data` of this provider.
  String get data;

  /// The parameter `dbSongs` of this provider.
  List<SongsEntity> get dbSongs;
}

class _GetMusicEntityProviderElement extends AutoDisposeProviderElement<int>
    with GetMusicEntityRef {
  _GetMusicEntityProviderElement(super.provider);

  @override
  String get data => (origin as GetMusicEntityProvider).data;
  @override
  List<SongsEntity> get dbSongs => (origin as GetMusicEntityProvider).dbSongs;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
