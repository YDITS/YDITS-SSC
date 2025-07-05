//
// YDITS for SSC
//
// Copyright (C) よね/Yone
//
// https://github.com/YDITS/YDITS-SSC
//

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ydits_ssc/apps/weather_earthquake_telop_display/model/weather_earthquake_telop_display_config.dart';

part 'weather_earthquake_telop_display_config_provider.g.dart';

@riverpod
WeatherEarthquakeTelopDisplayConfig
  weatherEarthquakeTelopDisplayConfig(_) {
    return WeatherEarthquakeTelopDisplayConfig();
  }

@riverpod
WeatherEarthquakeTelopDisplayAppConfig
  weatherEarthquakeTelopDisplayAppConfig(_) {
    return WeatherEarthquakeTelopDisplayAppConfig();
  }

@riverpod
WeatherEarthquakeTelopDisplayWindowConfig
  weatherEarthquakeTelopDisplayWindowConfig(_) {
    return WeatherEarthquakeTelopDisplayWindowConfig();
  }
