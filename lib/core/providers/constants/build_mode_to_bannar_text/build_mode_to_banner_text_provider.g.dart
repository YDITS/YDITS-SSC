// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'build_mode_to_banner_text_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(buildModeToBannarText)
const buildModeToBannarTextProvider = BuildModeToBannarTextProvider._();

final class BuildModeToBannarTextProvider
    extends
        $FunctionalProvider<
          Map<VersionLevels, String>,
          Map<VersionLevels, String>,
          Map<VersionLevels, String>
        >
    with $Provider<Map<VersionLevels, String>> {
  const BuildModeToBannarTextProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'buildModeToBannarTextProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$buildModeToBannarTextHash();

  @$internal
  @override
  $ProviderElement<Map<VersionLevels, String>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  Map<VersionLevels, String> create(Ref ref) {
    return buildModeToBannarText(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Map<VersionLevels, String> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Map<VersionLevels, String>>(value),
    );
  }
}

String _$buildModeToBannarTextHash() =>
    r'282ea5025e1ce128c01cc90c7674185f453ef5d8';
