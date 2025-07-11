//
// YDITS for SSC
//
// Copyright (C) よね/Yone
//
// https://github.com/YDITS/YDITS-SSC
//

import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:ydits_ssc/apps/weather_earthquake_telop_display/weather_earthquake_telop_display.dart';
import 'package:ydits_ssc/core/logger/logger_initializer.dart';

Future<void> main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  final Logger? logger = initializeLogger();
  await WeatherEarthquakeTelopDisplay(logger: logger).run();
}
