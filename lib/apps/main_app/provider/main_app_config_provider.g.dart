// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_app_config_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(yditsSscAppConfig)
const yditsSscAppConfigProvider = YditsSscAppConfigProvider._();

final class YditsSscAppConfigProvider
    extends
        $FunctionalProvider<
          YditsSscAppConfig,
          YditsSscAppConfig,
          YditsSscAppConfig
        >
    with $Provider<YditsSscAppConfig> {
  const YditsSscAppConfigProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'yditsSscAppConfigProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$yditsSscAppConfigHash();

  @$internal
  @override
  $ProviderElement<YditsSscAppConfig> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  YditsSscAppConfig create(Ref ref) {
    return yditsSscAppConfig(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(YditsSscAppConfig value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<YditsSscAppConfig>(value),
    );
  }
}

String _$yditsSscAppConfigHash() => r'1044092e5c7cc263472a8aea5d9a34f5ff2be544';

@ProviderFor(yditsSscWindowConfig)
const yditsSscWindowConfigProvider = YditsSscWindowConfigProvider._();

final class YditsSscWindowConfigProvider
    extends
        $FunctionalProvider<
          YditsSscWindowConfig,
          YditsSscWindowConfig,
          YditsSscWindowConfig
        >
    with $Provider<YditsSscWindowConfig> {
  const YditsSscWindowConfigProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'yditsSscWindowConfigProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$yditsSscWindowConfigHash();

  @$internal
  @override
  $ProviderElement<YditsSscWindowConfig> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  YditsSscWindowConfig create(Ref ref) {
    return yditsSscWindowConfig(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(YditsSscWindowConfig value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<YditsSscWindowConfig>(value),
    );
  }
}

String _$yditsSscWindowConfigHash() =>
    r'037c4d8b7f442a1e13bf783a05b817d70c023fb0';
