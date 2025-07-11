// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_timer_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$weatherTimerHash() => r'e1c92bf29a1d2536d62d778abee71bab9f0c555c';

/// A notifier for managing a timer that periodically triggers weather updates.
///
/// Copied from [WeatherTimer].
@ProviderFor(WeatherTimer)
final weatherTimerProvider =
    AutoDisposeNotifierProvider<WeatherTimer, WeatherTimerStateModel>.internal(
      WeatherTimer.new,
      name: r'weatherTimerProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$weatherTimerHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$WeatherTimer = AutoDisposeNotifier<WeatherTimerStateModel>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
