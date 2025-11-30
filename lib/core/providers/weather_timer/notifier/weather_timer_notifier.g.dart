// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_timer_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// A notifier for managing a timer that periodically triggers weather updates.

@ProviderFor(WeatherTimer)
const weatherTimerProvider = WeatherTimerProvider._();

/// A notifier for managing a timer that periodically triggers weather updates.
final class WeatherTimerProvider
    extends $NotifierProvider<WeatherTimer, WeatherTimerStateModel> {
  /// A notifier for managing a timer that periodically triggers weather updates.
  const WeatherTimerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'weatherTimerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$weatherTimerHash();

  @$internal
  @override
  WeatherTimer create() => WeatherTimer();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(WeatherTimerStateModel value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<WeatherTimerStateModel>(value),
    );
  }
}

String _$weatherTimerHash() => r'c4fa66a46c29c8cb6b9f4c955d64a1e1ee3be535';

/// A notifier for managing a timer that periodically triggers weather updates.

abstract class _$WeatherTimer extends $Notifier<WeatherTimerStateModel> {
  WeatherTimerStateModel build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<WeatherTimerStateModel, WeatherTimerStateModel>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<WeatherTimerStateModel, WeatherTimerStateModel>,
              WeatherTimerStateModel,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
