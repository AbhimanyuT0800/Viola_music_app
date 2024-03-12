// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_music_data.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getMusicPlayListHash() => r'5bda847930cb3ce1731b4176a4d52f069d5fa7cb';

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

/// See also [getMusicPlayList].
@ProviderFor(getMusicPlayList)
const getMusicPlayListProvider = GetMusicPlayListFamily();

/// See also [getMusicPlayList].
class GetMusicPlayListFamily extends Family<List<AudioSource>> {
  /// See also [getMusicPlayList].
  const GetMusicPlayListFamily();

  /// See also [getMusicPlayList].
  GetMusicPlayListProvider call({
    required List<String> data,
  }) {
    return GetMusicPlayListProvider(
      data: data,
    );
  }

  @override
  GetMusicPlayListProvider getProviderOverride(
    covariant GetMusicPlayListProvider provider,
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
  String? get name => r'getMusicPlayListProvider';
}

/// See also [getMusicPlayList].
class GetMusicPlayListProvider extends AutoDisposeProvider<List<AudioSource>> {
  /// See also [getMusicPlayList].
  GetMusicPlayListProvider({
    required List<String> data,
  }) : this._internal(
          (ref) => getMusicPlayList(
            ref as GetMusicPlayListRef,
            data: data,
          ),
          from: getMusicPlayListProvider,
          name: r'getMusicPlayListProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getMusicPlayListHash,
          dependencies: GetMusicPlayListFamily._dependencies,
          allTransitiveDependencies:
              GetMusicPlayListFamily._allTransitiveDependencies,
          data: data,
        );

  GetMusicPlayListProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.data,
  }) : super.internal();

  final List<String> data;

  @override
  Override overrideWith(
    List<AudioSource> Function(GetMusicPlayListRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetMusicPlayListProvider._internal(
        (ref) => create(ref as GetMusicPlayListRef),
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
    return _GetMusicPlayListProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetMusicPlayListProvider && other.data == data;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, data.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetMusicPlayListRef on AutoDisposeProviderRef<List<AudioSource>> {
  /// The parameter `data` of this provider.
  List<String> get data;
}

class _GetMusicPlayListProviderElement
    extends AutoDisposeProviderElement<List<AudioSource>>
    with GetMusicPlayListRef {
  _GetMusicPlayListProviderElement(super.provider);

  @override
  List<String> get data => (origin as GetMusicPlayListProvider).data;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
