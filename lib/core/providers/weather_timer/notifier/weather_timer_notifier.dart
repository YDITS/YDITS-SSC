//
// YDITS for SSC
//
// Copyright (C) よね/Yone
//
// https://github.com/YDITS/YDITS-SSC
//

import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ydits_ssc/core/providers/weather/notifier/weather_notifier.dart';
import 'package:ydits_ssc/core/providers/weather_timer/model/weather_timer_state_model.dart';

part 'weather_timer_notifier.g.dart';

/// A notifier for managing a timer that periodically triggers weather updates.
@riverpod
class WeatherTimer extends _$WeatherTimer {
  Timer? _timer;
  final List<void Function()> _listeners = [];

  /// Adds a listener to be called on each timer tick.
  void addListener(void Function() listener) {
    _listeners.add(listener);
  }

  @override
  WeatherTimerStateModel build() {
    return const WeatherTimerStateModel(isRunning: false);
  }

  /// Returns the underlying [Timer] instance.
  Timer? get timer => _timer;

  /// Starts the timer if it is not already active.
  void start() {
    if (_timer?.isActive == true) {
      return;
    }

    _timer = Timer.periodic(const Duration(seconds: 1), _loop);
    state = state.copyWith(isRunning: true);
  }

  /// Stops the timer.
  void stop() {
    _timer?.cancel();
    state = state.copyWith(isRunning: false);
  }

  /// The function that is executed on each timer tick.
  void _loop(Timer self) {
    ref.read(yditsSscWeatherProvider.notifier).update();

    for (final listener in _listeners) {
      listener();
    }
  }
}
