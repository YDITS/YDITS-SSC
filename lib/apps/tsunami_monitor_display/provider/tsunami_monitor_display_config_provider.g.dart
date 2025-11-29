// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tsunami_monitor_display_config_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(tsunamiMonitorDisplayAppConfig)
const tsunamiMonitorDisplayAppConfigProvider =
    TsunamiMonitorDisplayAppConfigProvider._();

final class TsunamiMonitorDisplayAppConfigProvider
    extends
        $FunctionalProvider<
          TsunamiMonitorDisplayAppConfig,
          TsunamiMonitorDisplayAppConfig,
          TsunamiMonitorDisplayAppConfig
        >
    with $Provider<TsunamiMonitorDisplayAppConfig> {
  const TsunamiMonitorDisplayAppConfigProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'tsunamiMonitorDisplayAppConfigProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$tsunamiMonitorDisplayAppConfigHash();

  @$internal
  @override
  $ProviderElement<TsunamiMonitorDisplayAppConfig> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  TsunamiMonitorDisplayAppConfig create(Ref ref) {
    return tsunamiMonitorDisplayAppConfig(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TsunamiMonitorDisplayAppConfig value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TsunamiMonitorDisplayAppConfig>(
        value,
      ),
    );
  }
}

String _$tsunamiMonitorDisplayAppConfigHash() =>
    r'1c21be7b771852cdb91f6d3981d4f0042f3d9377';

@ProviderFor(tsunamiMonitorDisplayWindowConfig)
const tsunamiMonitorDisplayWindowConfigProvider =
    TsunamiMonitorDisplayWindowConfigProvider._();

final class TsunamiMonitorDisplayWindowConfigProvider
    extends
        $FunctionalProvider<
          TsunamiMonitorDisplayWindowConfig,
          TsunamiMonitorDisplayWindowConfig,
          TsunamiMonitorDisplayWindowConfig
        >
    with $Provider<TsunamiMonitorDisplayWindowConfig> {
  const TsunamiMonitorDisplayWindowConfigProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'tsunamiMonitorDisplayWindowConfigProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() =>
      _$tsunamiMonitorDisplayWindowConfigHash();

  @$internal
  @override
  $ProviderElement<TsunamiMonitorDisplayWindowConfig> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  TsunamiMonitorDisplayWindowConfig create(Ref ref) {
    return tsunamiMonitorDisplayWindowConfig(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TsunamiMonitorDisplayWindowConfig value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TsunamiMonitorDisplayWindowConfig>(
        value,
      ),
    );
  }
}

String _$tsunamiMonitorDisplayWindowConfigHash() =>
    r'49e606ef56946788c77bf8c7b9d407d1aee05146';
