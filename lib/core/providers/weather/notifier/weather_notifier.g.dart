// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// A notifier for managing the weather state of the YDITS SSC application.

@ProviderFor(YditsSscWeather)
const yditsSscWeatherProvider = YditsSscWeatherProvider._();

/// A notifier for managing the weather state of the YDITS SSC application.
final class YditsSscWeatherProvider
    extends $NotifierProvider<YditsSscWeather, WeatherStateModel> {
  /// A notifier for managing the weather state of the YDITS SSC application.
  const YditsSscWeatherProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'yditsSscWeatherProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$yditsSscWeatherHash();

  @$internal
  @override
  YditsSscWeather create() => YditsSscWeather();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(WeatherStateModel value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<WeatherStateModel>(value),
    );
  }
}

String _$yditsSscWeatherHash() => r'2da85b4fb9fdd27d3114a3a1a91e6e4a52b9faf1';

/// A notifier for managing the weather state of the YDITS SSC application.

abstract class _$YditsSscWeather extends $Notifier<WeatherStateModel> {
  WeatherStateModel build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<WeatherStateModel, WeatherStateModel>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<WeatherStateModel, WeatherStateModel>,
              WeatherStateModel,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
