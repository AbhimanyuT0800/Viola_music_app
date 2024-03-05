// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'is_favorites.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$isFavHash() => r'caaed14635db540eae2b9fa44d600f27b9a0ad0f';

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

/// See also [isFav].
@ProviderFor(isFav)
const isFavProvider = IsFavFamily();

/// See also [isFav].
class IsFavFamily extends Family<bool> {
  /// See also [isFav].
  const IsFavFamily();

  /// See also [isFav].
  IsFavProvider call({
    required String data,
  }) {
    return IsFavProvider(
      data: data,
    );
  }

  @override
  IsFavProvider getProviderOverride(
    covariant IsFavProvider provider,
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
  String? get name => r'isFavProvider';
}

/// See also [isFav].
class IsFavProvider extends AutoDisposeProvider<bool> {
  /// See also [isFav].
  IsFavProvider({
    required String data,
  }) : this._internal(
          (ref) => isFav(
            ref as IsFavRef,
            data: data,
          ),
          from: isFavProvider,
          name: r'isFavProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$isFavHash,
          dependencies: IsFavFamily._dependencies,
          allTransitiveDependencies: IsFavFamily._allTransitiveDependencies,
          data: data,
        );

  IsFavProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.data,
  }) : super.internal();

  final String data;

  @override
  Override overrideWith(
    bool Function(IsFavRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: IsFavProvider._internal(
        (ref) => create(ref as IsFavRef),
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
  AutoDisposeProviderElement<bool> createElement() {
    return _IsFavProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is IsFavProvider && other.data == data;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, data.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin IsFavRef on AutoDisposeProviderRef<bool> {
  /// The parameter `data` of this provider.
  String get data;
}

class _IsFavProviderElement extends AutoDisposeProviderElement<bool>
    with IsFavRef {
  _IsFavProviderElement(super.provider);

  @override
  String get data => (origin as IsFavProvider).data;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
