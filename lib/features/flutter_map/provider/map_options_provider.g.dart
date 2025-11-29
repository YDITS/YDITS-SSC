// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_options_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// A provider that returns the appropriate [MapOptions] based on the given [MapTypes].

@ProviderFor(mapOptions)
const mapOptionsProvider = MapOptionsFamily._();

/// A provider that returns the appropriate [MapOptions] based on the given [MapTypes].

final class MapOptionsProvider
    extends $FunctionalProvider<MapOptions, MapOptions, MapOptions>
    with $Provider<MapOptions> {
  /// A provider that returns the appropriate [MapOptions] based on the given [MapTypes].
  const MapOptionsProvider._({
    required MapOptionsFamily super.from,
    required MapTypes super.argument,
  }) : super(
         retry: null,
         name: r'mapOptionsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$mapOptionsHash();

  @override
  String toString() {
    return r'mapOptionsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<MapOptions> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  MapOptions create(Ref ref) {
    final argument = this.argument as MapTypes;
    return mapOptions(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MapOptions value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MapOptions>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is MapOptionsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$mapOptionsHash() => r'3039335e4040e6a398de58b11463e71375649517';

/// A provider that returns the appropriate [MapOptions] based on the given [MapTypes].

final class MapOptionsFamily extends $Family
    with $FunctionalFamilyOverride<MapOptions, MapTypes> {
  const MapOptionsFamily._()
    : super(
        retry: null,
        name: r'mapOptionsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// A provider that returns the appropriate [MapOptions] based on the given [MapTypes].

  MapOptionsProvider call(MapTypes mapType) =>
      MapOptionsProvider._(argument: mapType, from: this);

  @override
  String toString() => r'mapOptionsProvider';
}
