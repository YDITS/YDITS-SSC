// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_options_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$mapOptionsHash() => r'46c83b570bc0e9ece425f00a89827a66931b9923';

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

/// See also [mapOptions].
@ProviderFor(mapOptions)
const mapOptionsProvider = MapOptionsFamily();

/// See also [mapOptions].
class MapOptionsFamily extends Family<MapOptions> {
  /// See also [mapOptions].
  const MapOptionsFamily();

  /// See also [mapOptions].
  MapOptionsProvider call(MapTypes mapType) {
    return MapOptionsProvider(mapType);
  }

  @override
  MapOptionsProvider getProviderOverride(
    covariant MapOptionsProvider provider,
  ) {
    return call(provider.mapType);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'mapOptionsProvider';
}

/// See also [mapOptions].
class MapOptionsProvider extends AutoDisposeProvider<MapOptions> {
  /// See also [mapOptions].
  MapOptionsProvider(MapTypes mapType)
    : this._internal(
        (ref) => mapOptions(ref as MapOptionsRef, mapType),
        from: mapOptionsProvider,
        name: r'mapOptionsProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$mapOptionsHash,
        dependencies: MapOptionsFamily._dependencies,
        allTransitiveDependencies: MapOptionsFamily._allTransitiveDependencies,
        mapType: mapType,
      );

  MapOptionsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.mapType,
  }) : super.internal();

  final MapTypes mapType;

  @override
  Override overrideWith(MapOptions Function(MapOptionsRef provider) create) {
    return ProviderOverride(
      origin: this,
      override: MapOptionsProvider._internal(
        (ref) => create(ref as MapOptionsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        mapType: mapType,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<MapOptions> createElement() {
    return _MapOptionsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is MapOptionsProvider && other.mapType == mapType;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, mapType.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin MapOptionsRef on AutoDisposeProviderRef<MapOptions> {
  /// The parameter `mapType` of this provider.
  MapTypes get mapType;
}

class _MapOptionsProviderElement extends AutoDisposeProviderElement<MapOptions>
    with MapOptionsRef {
  _MapOptionsProviderElement(super.provider);

  @override
  MapTypes get mapType => (origin as MapOptionsProvider).mapType;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
