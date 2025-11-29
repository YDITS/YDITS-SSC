// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'eew_monitor_display_config_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(eewMonitorDisplayAppConfig)
const eewMonitorDisplayAppConfigProvider =
    EewMonitorDisplayAppConfigProvider._();

final class EewMonitorDisplayAppConfigProvider
    extends
        $FunctionalProvider<
          EEWMonitorDisplayAppConfig,
          EEWMonitorDisplayAppConfig,
          EEWMonitorDisplayAppConfig
        >
    with $Provider<EEWMonitorDisplayAppConfig> {
  const EewMonitorDisplayAppConfigProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'eewMonitorDisplayAppConfigProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$eewMonitorDisplayAppConfigHash();

  @$internal
  @override
  $ProviderElement<EEWMonitorDisplayAppConfig> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  EEWMonitorDisplayAppConfig create(Ref ref) {
    return eewMonitorDisplayAppConfig(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(EEWMonitorDisplayAppConfig value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<EEWMonitorDisplayAppConfig>(value),
    );
  }
}

String _$eewMonitorDisplayAppConfigHash() =>
    r'7bde2d3b957277d6eaf11acf0835b416a5cc2878';

@ProviderFor(eewMonitorDisplayWindowConfig)
const eewMonitorDisplayWindowConfigProvider =
    EewMonitorDisplayWindowConfigProvider._();

final class EewMonitorDisplayWindowConfigProvider
    extends
        $FunctionalProvider<
          EEWMonitorDisplayWindowConfig,
          EEWMonitorDisplayWindowConfig,
          EEWMonitorDisplayWindowConfig
        >
    with $Provider<EEWMonitorDisplayWindowConfig> {
  const EewMonitorDisplayWindowConfigProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'eewMonitorDisplayWindowConfigProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$eewMonitorDisplayWindowConfigHash();

  @$internal
  @override
  $ProviderElement<EEWMonitorDisplayWindowConfig> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  EEWMonitorDisplayWindowConfig create(Ref ref) {
    return eewMonitorDisplayWindowConfig(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(EEWMonitorDisplayWindowConfig value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<EEWMonitorDisplayWindowConfig>(
        value,
      ),
    );
  }
}

String _$eewMonitorDisplayWindowConfigHash() =>
    r'02d48f31cbc18c5cfd0f4c04e04f2ecf1cd775df';
