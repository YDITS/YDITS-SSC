//
// YDITS for SSC
//
// Copyright (C) よね/Yone
//
// https://github.com/YDITS/YDITS-SSC
//

import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:ydits_ssc/src/windows/weather_earthquake_telop_display/pages/pages.dart';

class WeatherEarthquakeTelopDisplayApp extends StatelessWidget {
  final Logger logger;

  const WeatherEarthquakeTelopDisplayApp({super.key, required this.logger});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(logger: logger),
    );
  }
}
