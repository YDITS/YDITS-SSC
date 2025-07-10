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

/// A notifier for managing the weather state of the YDITS SSC application.
@riverpod
class YditsSscWeather extends _$YditsSscWeather {
  late WeatherFactory _weatherFactory;

  @override
  WeatherStateModel build() {
    // Initialize the WeatherFactory after the first frame is rendered.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initWeatherFactory();
    });

    return const WeatherStateModel();
  }

  /// Initializes the [WeatherFactory] with the API key.
  Future<void> _initWeatherFactory() async {
    final config = ref.read(weatherEarthquakeTelopDisplayConfigProvider);
    _weatherFactory = WeatherFactory(config.openWeatherMapApiKey);
  }

  /// Updates the weather information for all prefectures in Japan.
  Future<void> update() async {
    final buffer = StringBuffer();

    for (final prefecture in JapanPrefectures.stringList) {
      try {
        final weather = await _weatherFactory.currentWeatherByCityName(
          prefecture,
        );
        buffer.write(
          '$prefecture: ${weather.temperature?.celsius?.toStringAsFixed(1)}°C ${weather.weatherDescription} | ',
        );
      } catch (e) {
        // Handle or log the error for a specific prefecture if needed.
        buffer.write('$prefecture: (error) | ');
      }
    }

    state = state.copyWith(newTelopText: buffer.toString());
  }
}
