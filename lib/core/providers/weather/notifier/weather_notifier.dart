//
// YDITS for SSC
//
// Copyright (C) よね/Yone
//
// https://github.com/YDITS/YDITS-SSC
//

import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:weather/weather.dart';
import 'package:ydits_ssc/apps/weather_earthquake_telop_display/provider/weather_earthquake_telop_display_config_provider.dart';
import 'package:ydits_ssc/core/providers/weather/model/weather_state_model.dart';
import 'package:ydits_ssc/core/resources/japan_prefectures.dart';

part 'weather_notifier.g.dart';

@riverpod
class YditsSscWeather extends _$YditsSscWeather {
  late WeatherFactory _weatherFactory;

  @override
  WeatherStateModel build() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initWeatherFactory();
    });

    return const WeatherStateModel();
  }

  Future<void> _initWeatherFactory() async {
    final config = ref.read(weatherEarthquakeTelopDisplayConfigProvider);
    _weatherFactory = WeatherFactory(config.openWeatherMapApiKey);
  }

  Future<void> update() async {
    String text = "";

    for (String prefecture in JapanPrefectures.stringList) {
      Weather weather = await _weatherFactory.currentWeatherByCityName(
        prefecture,
      );
      text +=
          '$prefecture: ${weather.temperature?.celsius?.toStringAsFixed(1)}°C ${weather.weatherDescription} | ';
    }

    state = state.copyWith(newTelopText: text);
  }
}
