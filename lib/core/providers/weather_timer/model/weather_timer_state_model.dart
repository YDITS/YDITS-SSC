//
// YDITS for SSC
//
// Copyright (C) よね/Yone
//
// https://github.com/YDITS/YDITS-SSC
//

final class WeatherTimerStateModel {
  const WeatherTimerStateModel({required this.isRunning});

  final bool isRunning;

  WeatherTimerStateModel copyWith({required isRunning}) {
    return WeatherTimerStateModel(isRunning: isRunning);
  }
}