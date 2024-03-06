// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_music_data.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getAllMusicPlayListHash() =>
    r'bebc249adc1a9b5f22c691b2a437cd7d432f76ed';

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

/// See also [getAllMusicPlayList].
@ProviderFor(getAllMusicPlayList)
const getAllMusicPlayListProvider = GetAllMusicPlayListFamily();

/// See also [getAllMusicPlayList].
class GetAllMusicPlayListFamily extends Family<List<AudioSource>> {
  /// See also [getAllMusicPlayList].
  const GetAllMusicPlayListFamily();

  /// See also [getAllMusicPlayList].
  GetAllMusicPlayListProvider call({
    required List<SongModel> data,
  }) {
    return GetAllMusicPlayListProvider(
      data: data,
    );
  }

  @override
  GetAllMusicPlayListProvider getProviderOverride(
    covariant GetAllMusicPlayListProvider provider,
  ) {
    return call(
      data: provider.data,
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
  String? get name => r'getAllMusicPlayListProvider';
}

/// See also [getAllMusicPlayList].
class GetAllMusicPlayListProvider
    extends AutoDisposeProvider<List<AudioSource>> {
  /// See also [getAllMusicPlayList].
  GetAllMusicPlayListProvider({
    required List<SongModel> data,
  }) : this._internal(
          (ref) => getAllMusicPlayList(
            ref as GetAllMusicPlayListRef,
            data: data,
          ),
          from: getAllMusicPlayListProvider,
          name: r'getAllMusicPlayListProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getAllMusicPlayListHash,
          dependencies: GetAllMusicPlayListFamily._dependencies,
          allTransitiveDependencies:
              GetAllMusicPlayListFamily._allTransitiveDependencies,
          data: data,
        );

  GetAllMusicPlayListProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.data,
  }) : super.internal();

  final List<SongModel> data;

  @override
  Override overrideWith(
    List<AudioSource> Function(GetAllMusicPlayListRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetAllMusicPlayListProvider._internal(
        (ref) => create(ref as GetAllMusicPlayListRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        data: data,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<List<AudioSource>> createElement() {
    return _GetAllMusicPlayListProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetAllMusicPlayListProvider && other.data == data;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, data.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetAllMusicPlayListRef on AutoDisposeProviderRef<List<AudioSource>> {
  /// The parameter `data` of this provider.
  List<SongModel> get data;
}

class _GetAllMusicPlayListProviderElement
    extends AutoDisposeProviderElement<List<AudioSource>>
    with GetAllMusicPlayListRef {
  _GetAllMusicPlayListProviderElement(super.provider);

  @override
  List<SongModel> get data => (origin as GetAllMusicPlayListProvider).data;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
