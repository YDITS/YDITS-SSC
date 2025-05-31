//
// YDITS for SSC
//
// Copyright (C) よね/Yone
//
// https://github.com/YDITS/YDITS-SSC
//

import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';
import 'package:window_size/window_size.dart';
import 'package:flutter/material.dart';

import 'package:ydits_ssc/src/windows/weather_earthquake_telop_display/app.dart';
import 'package:ydits_ssc/src/windows/weather_earthquake_telop_display/config.dart';

class WeatherEarthquakeTelopDisplay {
  late final Logger logger;
  late final Rect? frame;
  late final WeatherEarthquakeTelopDisplayConfig config;
  late final WeatherEarthquakeTelopDisplayAppConfig appConfig;
  late final WeatherEarthquakeTelopDisplayWindowConfig windowConfig;

  Future<void> main() async {
    WidgetsFlutterBinding.ensureInitialized();

    initializeLogger();

    config = WeatherEarthquakeTelopDisplayConfig();
    appConfig = WeatherEarthquakeTelopDisplayAppConfig();
    windowConfig = WeatherEarthquakeTelopDisplayWindowConfig();

    try {
      await initializeDesktopWindow();
    } catch (error) {
      logger.warning(error);
    }

    runApp(
      ProviderScope(
        child: WeatherEarthquakeTelopDisplayApp(
          logger: logger,
          config: config,
          appConfig: appConfig,
          windowConfig: windowConfig,
        ),
      )
    );
  }

  void initializeLogger() {
    logger = Logger('Logger');
    Logger.root.level = Level.ALL;
    Logger.root.onRecord.listen((record) {
      print('${record.level.name}: ${record.time}: ${record.message}');
    });
  }

  Future<void> initializeDesktopWindow() async {
    return await setWindowConfig();
  }

  Future<void> setWindowConfig() async {
    if (!isPlatformDesktop) {
      return;
    }

    setWindowTitle(windowConfig.title);
    setWindowFrame(windowConfig.windowFrame);
    setWindowMinSize(windowConfig.windowMinSize);
    setWindowMaxSize(windowConfig.windowMaxSize);

    final info = await getCurrentScreen();
    frame = info?.frame;
    logger.info(frame);
  }

  bool get isPlatformDesktop {
    return Platform.isWindows || Platform.isLinux || Platform.isMacOS;
  }
}
