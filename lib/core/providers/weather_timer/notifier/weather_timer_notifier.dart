//
// YDITS for SSC
//
// Copyright (C) よね/Yone
//
// https://github.com/YDITS/YDITS-SSC
//

import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ydits_ssc/core/providers/weather_timer/model/weather_timer_state_model.dart';

part 'weather_timer_notifier.g.dart';

@riverpod
class WeatherTimerNotifier extends _$WeatherTimerNotifier {
  Timer? _timer;

  @override
  WeatherTimerStateModel build() {
    return const WeatherTimerStateModel(isRunning: false);
  }

  Timer? get timer {
    return _timer;
  }

  void start() {
    if (_timer!.isActive) {
      return;
    }

    _timer = Timer.periodic(const Duration(seconds: 1), (self) => loop(self));
    state = state.copyWith(isRunning: true);
  }

  void stop() {
    _timer?.cancel();
    state = state.copyWith(isRunning: false);
  }

  @override
  void loop(Timer self) {}
}
