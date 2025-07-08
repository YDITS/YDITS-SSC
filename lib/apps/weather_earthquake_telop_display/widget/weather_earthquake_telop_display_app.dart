//
// YDITS for SSC
//
// Copyright (C) よね/Yone
//
// https://github.com/YDITS/YDITS-SSC
//

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ydits_ssc/features/weather_earthquake_telop_display_home/widget/weather_earthquake_telop_display_home.dart';

/// Weather Earthquake Telop Display アプリケーションウィジェット
class WeatherEarthquakeTelopDisplayApp extends ConsumerWidget {
  const WeatherEarthquakeTelopDisplayApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const MaterialApp(home: WeatherEarthquakeTelopDisplayHomePage());
  }
}
