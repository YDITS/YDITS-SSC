// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'copyright_name_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// A provider that returns the copyright holder's name.

@ProviderFor(copyrightName)
const copyrightNameProvider = CopyrightNameProvider._();

/// A provider that returns the copyright holder's name.

final class CopyrightNameProvider
    extends $FunctionalProvider<String, String, String>
    with $Provider<String> {
  /// A provider that returns the copyright holder's name.
  const CopyrightNameProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'copyrightNameProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$copyrightNameHash();

  @$internal
  @override
  $ProviderElement<String> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  String create(Ref ref) {
    return copyrightName(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$copyrightNameHash() => r'78116b05edbdef91fdf30b58416a74caeb16713f';
