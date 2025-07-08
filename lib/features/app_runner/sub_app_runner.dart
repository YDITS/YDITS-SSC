//
// YDITS for SSC
//
// Copyright (C) よね/Yone
//
// https://github.com/YDITS/YDITS-SSC
//

import 'dart:convert';

import 'package:ydits_ssc/apps/eew_monitor_display/eew_monitor_display.dart';
import 'package:ydits_ssc/apps/tsunami_monitor_display/tsunami_monitor_display.dart';
import 'package:ydits_ssc/apps/weather_earthquake_telop_display/weather_earthquake_telop_display.dart';
import 'package:ydits_ssc/core/app_runner/sub_app_runner.dart';
import 'package:ydits_ssc/core/sub_windows/sub_windows.dart';

/// The sub-application runner for the YDITS for SSC application.
///
/// This class is responsible for routing and running the various sub-applications
/// based on the provided arguments.
final class YditsSscSubAppRunner extends SubAppRunner {
  YditsSscSubAppRunner({super.logger});

  @override
  Future<void> run(List<String> args) async {
    logger?.info('Running sub-application with args: $args');

    try {
      final windowString = jsonDecode(args[2])['window'] as String?;
      if (windowString == null) {
        throw Exception('Window argument is missing.');
      }

      logger?.info('Target window: $windowString');

      final targetWindow = subWindowsStringToEnum[windowString];
      if (targetWindow == null) {
        throw Exception('Unknown window: $windowString');
      }

      final subWindowsRoute = <SubWindows, Future<void> Function()>{
        SubWindows.eewMonitorDisplay:
            () => EewMonitorDisplay(logger: logger).run(),
        SubWindows.tsunamiMonitorDisplay:
            () => TsunamiMonitorDisplay(logger: logger).run(),
        SubWindows.weatherEarthquakeTelopDisplay:
            () => WeatherEarthquakeTelopDisplay(logger: logger).run(),
      };

      final runner = subWindowsRoute[targetWindow];
      if (runner == null) {
        throw Exception('No route found for window: $targetWindow');
      }

      await runner();
    } catch (error, stackTrace) {
      logger?.severe('Failed to run sub-application.', error, stackTrace);
      rethrow;
    }
  }
}
