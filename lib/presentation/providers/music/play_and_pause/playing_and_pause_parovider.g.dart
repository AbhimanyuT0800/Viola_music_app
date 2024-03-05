// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'playing_and_pause_parovider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$playMusicHash() => r'40eb7ea08d7d340457114d7a60fed88be3cdc35e';

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

/// See also [playMusic].
@ProviderFor(playMusic)
const playMusicProvider = PlayMusicFamily();

/// See also [playMusic].
class PlayMusicFamily extends Family<AsyncValue<void>> {
  /// See also [playMusic].
  const PlayMusicFamily();

  /// See also [playMusic].
  PlayMusicProvider call(
    SongModel model,
  ) {
    return PlayMusicProvider(
      model,
    );
  }

  @override
  PlayMusicProvider getProviderOverride(
    covariant PlayMusicProvider provider,
  ) {
    return call(
      provider.model,
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
  String? get name => r'playMusicProvider';
}

/// See also [playMusic].
class PlayMusicProvider extends AutoDisposeFutureProvider<void> {
  /// See also [playMusic].
  PlayMusicProvider(
    SongModel model,
  ) : this._internal(
          (ref) => playMusic(
            ref as PlayMusicRef,
            model,
          ),
          from: playMusicProvider,
          name: r'playMusicProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$playMusicHash,
          dependencies: PlayMusicFamily._dependencies,
          allTransitiveDependencies: PlayMusicFamily._allTransitiveDependencies,
          model: model,
        );

  PlayMusicProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.model,
  }) : super.internal();

  final SongModel model;

  @override
  Override overrideWith(
    FutureOr<void> Function(PlayMusicRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: PlayMusicProvider._internal(
        (ref) => create(ref as PlayMusicRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        model: model,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _PlayMusicProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PlayMusicProvider && other.model == model;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, model.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin PlayMusicRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `model` of this provider.
  SongModel get model;
}

class _PlayMusicProviderElement extends AutoDisposeFutureProviderElement<void>
    with PlayMusicRef {
  _PlayMusicProviderElement(super.provider);

  @override
  SongModel get model => (origin as PlayMusicProvider).model;
}

String _$pauseMusicHash() => r'bfccc0d3e767c10f081c82031ad05a8731ff733f';

/// See also [pauseMusic].
@ProviderFor(pauseMusic)
const pauseMusicProvider = PauseMusicFamily();

/// See also [pauseMusic].
class PauseMusicFamily extends Family<AsyncValue<void>> {
  /// See also [pauseMusic].
  const PauseMusicFamily();

  /// See also [pauseMusic].
  PauseMusicProvider call(
    SongModel model,
  ) {
    return PauseMusicProvider(
      model,
    );
  }

  @override
  PauseMusicProvider getProviderOverride(
    covariant PauseMusicProvider provider,
  ) {
    return call(
      provider.model,
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
  String? get name => r'pauseMusicProvider';
}

/// See also [pauseMusic].
class PauseMusicProvider extends AutoDisposeFutureProvider<void> {
  /// See also [pauseMusic].
  PauseMusicProvider(
    SongModel model,
  ) : this._internal(
          (ref) => pauseMusic(
            ref as PauseMusicRef,
            model,
          ),
          from: pauseMusicProvider,
          name: r'pauseMusicProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$pauseMusicHash,
          dependencies: PauseMusicFamily._dependencies,
          allTransitiveDependencies:
              PauseMusicFamily._allTransitiveDependencies,
          model: model,
        );

  PauseMusicProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.model,
  }) : super.internal();

  final SongModel model;

  @override
  Override overrideWith(
    FutureOr<void> Function(PauseMusicRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: PauseMusicProvider._internal(
        (ref) => create(ref as PauseMusicRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        model: model,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _PauseMusicProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PauseMusicProvider && other.model == model;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, model.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin PauseMusicRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `model` of this provider.
  SongModel get model;
}

class _PauseMusicProviderElement extends AutoDisposeFutureProviderElement<void>
    with PauseMusicRef {
  _PauseMusicProviderElement(super.provider);

  @override
  SongModel get model => (origin as PauseMusicProvider).model;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
