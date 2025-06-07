//
// YDITS for SSC
//
// Copyright (C) よね/Yone
//
// https://github.com/YDITS/YDITS-SSC
//

import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:ydits_ssc/features/sub_apps/weather_earthquake_telop_display/config.dart';
import 'package:ydits_ssc/features/sub_apps/weather_earthquake_telop_display/pages/pages.dart';

class WeatherEarthquakeTelopDisplayApp extends StatelessWidget {
  final Logger logger;
  final WeatherEarthquakeTelopDisplayConfig config;
  final WeatherEarthquakeTelopDisplayAppConfig appConfig;
  final WeatherEarthquakeTelopDisplayWindowConfig windowConfig;

  const WeatherEarthquakeTelopDisplayApp({
    super.key,
    required this.logger,
    required this.config,
    required this.appConfig,
    required this.windowConfig,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WeatherEarthquakeTelopDisplayHomePage(
        logger: logger,
        config: config,
        appConfig: appConfig,
        windowConfig: windowConfig,
      ),
    );
  }
}
