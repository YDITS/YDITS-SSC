// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flutter_map_user_agent_package_name_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// A provider that supplies the user agent package name for the map service.

@ProviderFor(flutterMapUserAgentPackageName)
const flutterMapUserAgentPackageNameProvider =
    FlutterMapUserAgentPackageNameProvider._();

/// A provider that supplies the user agent package name for the map service.

final class FlutterMapUserAgentPackageNameProvider
    extends $FunctionalProvider<String, String, String>
    with $Provider<String> {
  /// A provider that supplies the user agent package name for the map service.
  const FlutterMapUserAgentPackageNameProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'flutterMapUserAgentPackageNameProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$flutterMapUserAgentPackageNameHash();

  @$internal
  @override
  $ProviderElement<String> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  String create(Ref ref) {
    return flutterMapUserAgentPackageName(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$flutterMapUserAgentPackageNameHash() =>
    r'3c2097e21839a8e8577831a82a88354159a907a0';
