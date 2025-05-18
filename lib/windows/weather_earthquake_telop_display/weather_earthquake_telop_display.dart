//
// YDITS for SSC
//
// Copyright (C) よね/Yone
//
// https://github.com/YDITS/YDITS-SSC
//

import 'dart:io';
import 'package:logging/logging.dart';
import 'package:window_size/window_size.dart';
import 'package:flutter/material.dart';

import 'package:ydits_ssc/windows/weather_earthquake_telop_display/app.dart';
import 'package:ydits_ssc/windows/weather_earthquake_telop_display/config.dart';

class WeatherEarthquakeTelopDisplay {
  late final Logger logger;
  late final Rect? frame;

  Future<void> main() async {
    WidgetsFlutterBinding.ensureInitialized();

    initializeLogger();

    try {
      await initializeDesktopWindow();
    } catch (error) {
      logger.warning(error);
    }

    runApp(
      WeatherEarthquakeTelopDisplayApp(logger: logger),
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

    setWindowTitle(Config.windowTitle);
    setWindowFrame(Config.windowFrame);
    setWindowMinSize(Config.windowMinSize);
    setWindowMaxSize(Config.windowMaxSize);

    final info = await getCurrentScreen();
    frame = info?.frame;
    logger.info(frame);
  }

  bool get isPlatformDesktop {
    return Platform.isWindows || Platform.isLinux || Platform.isMacOS;
  }
}
