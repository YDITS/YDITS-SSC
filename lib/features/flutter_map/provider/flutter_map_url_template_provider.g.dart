// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flutter_map_url_template_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// A provider that supplies the URL template for the map tiles.

@ProviderFor(flutterMapUrlTemplate)
const flutterMapUrlTemplateProvider = FlutterMapUrlTemplateProvider._();

/// A provider that supplies the URL template for the map tiles.

final class FlutterMapUrlTemplateProvider
    extends $FunctionalProvider<String, String, String>
    with $Provider<String> {
  /// A provider that supplies the URL template for the map tiles.
  const FlutterMapUrlTemplateProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'flutterMapUrlTemplateProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$flutterMapUrlTemplateHash();

  @$internal
  @override
  $ProviderElement<String> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  String create(Ref ref) {
    return flutterMapUrlTemplate(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$flutterMapUrlTemplateHash() =>
    r'14655b8bde970177aa9fd94cbdfbac6be4a7cd20';
