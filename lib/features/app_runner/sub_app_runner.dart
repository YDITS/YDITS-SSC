//
// YDITS for SSC
//
// Copyright (C) よね/Yone
//
// https://github.com/YDITS/YDITS-SSC
//

import 'dart:convert';

import 'package:ydits_ssc/core/app_runner/sub_app_runner.dart';
import 'package:ydits_ssc/core/sub_windows/sub_windows_enum.dart';
import 'package:ydits_ssc/core/sub_windows/sub_windows_from_string.dart';

import 'package:ydits_ssc/apps/eew_monitor_display/eew_monitor_display.dart';
import 'package:ydits_ssc/apps/tsunami_monitor_display/tsunami_monitor_display.dart';
import 'package:ydits_ssc/apps/weather_earthquake_telop_display/weather_earthquake_telop_display.dart';

/// YDITS for SSC サブアプリケーションの実行管理
final class YditsSscSubAppRunner extends SubAppRunner {
  YditsSscSubAppRunner({super.logger});

  @override
  Future<void> run(List<String> args) async {
    logger?.info("Running sub application...");
    logger?.info("Window ID: ${args[1]}");
    logger?.info("Window Args: ${args[2]}");

    final String windowString = jsonDecode(args[2])["window"];

    logger?.info("Window: $windowString");

    if (!subWindowsStringToEnum.containsKey(windowString)) {
      throw Exception("Unknown window: $windowString");
    }

    final SubWindows? targetWindow = subWindowsStringToEnum[windowString];

    final Map<SubWindows, Function()> subWindowsRoute = {
      SubWindows.eewMonitorDisplay: () async {
        logger?.info("Starting EEW Monitor Display Window...");
        await EewMonitorDisplay().main();
      },
      SubWindows.tsunamiMonitorDisplay: () async {
        logger?.info("Starting Tsunami Monitor Display Window...");
        await TsunamiMonitorDisplay().main();
      },
      SubWindows.weatherEarthquakeTelopDisplay: () async {
        logger?.info("Starting Weather Earthquake Telop Display Window...");
        await WeatherEarthquakeTelopDisplay().main();
      },
    };

    if (!subWindowsRoute.containsKey(targetWindow)) {
      throw Exception("Could not found window route: $targetWindow");
    }

    subWindowsRoute[targetWindow]!();
  }
}
