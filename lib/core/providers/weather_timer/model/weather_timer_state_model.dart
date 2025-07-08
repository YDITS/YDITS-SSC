//
// YDITS for SSC
//
// Copyright (C) よね/Yone
//
// https://github.com/YDITS/YDITS-SSC
//

/// A data model representing the state of the weather timer.
final class WeatherTimerStateModel {
  const WeatherTimerStateModel({required this.isRunning});

  /// Indicates whether the timer is currently running.
  final bool isRunning;

  /// Creates a copy of this model with the given fields replaced with new values.
  WeatherTimerStateModel copyWith({required bool isRunning}) {
    return WeatherTimerStateModel(isRunning: isRunning);
  }
}
