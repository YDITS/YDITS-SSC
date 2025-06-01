//
// YDITS for SSC
//
// Copyright (C) よね/Yone
//
// https://github.com/YDITS/YDITS-SSC
//

import 'dart:convert';
import 'package:logging/logging.dart';
import 'package:ydits_ssc/core/sub_windows/sub_windows.dart';
import 'package:ydits_ssc/core/sub_windows/sub_windows_from_string.dart';
import 'package:ydits_ssc/src/windows/windows.dart';

/// YDITS for SSC サブアプリケーションの実行管理
final class YditsSscSubAppRunner {
  YditsSscSubAppRunner({
    this.logger,
  });

  /// Loggerインスタンス
  final Logger? logger;

  /// サブアプリケーションを実行する
  Future<void> run(List<String> args) async {
    logger?.info("Running sub window...");
    logger?.info("Window ID: ${args[1]}");
    logger?.info("Window Args: ${args[2]}");

    final String windowString = jsonDecode(args[2])["window"];

    logger?.info("Window: $windowString");

    if (!subWindowsStringToEnum.containsKey(windowString)) {
      throw Exception("Unknown window: $windowString");
    }

    final SubWindows? window = subWindowsStringToEnum[windowString];

    final Map<SubWindows, Function()> subWindowsRoot = {
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
      }
    };

    if (!subWindowsRoot.containsKey(window)) {
      throw Exception("Could not found window root: $window");
    }

    subWindowsRoot[window]!();
  }
}
