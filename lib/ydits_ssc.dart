//
// YDITS for SSC
//
// Copyright (C) よね/Yone
//
// https://github.com/YDITS/YDITS-SSC
//

import 'dart:convert' as dart_convert;
import 'dart:io' as dart_io;
import 'dart:ui' as dart_ui;
import 'package:logging/logging.dart' as logging;
import 'package:desktop_multi_window/desktop_multi_window.dart' as desktop_multi_window;
import 'package:window_size/window_size.dart' as window_size;
import 'package:flutter/material.dart' as flutter;

import 'package:ydits_ssc/core/window_manager/window_manager.dart';
import 'package:ydits_ssc/core/sub_windows/sub_windows.dart';
import 'package:ydits_ssc/core/sub_windows/sub_windows_title.dart';
import 'package:ydits_ssc/app.dart';
import 'package:ydits_ssc/config.dart';
import 'package:ydits_ssc/windows/windows.dart';

class YditsSsc {
  late final logging.Logger logger;
  late final YditsSscConfig config;
  late final YditsSscWindowConfig windowConfig;
  late final dart_ui.Rect? mainWindowFrame;
  late final YditsSscApp mainApp;
  late final WindowManager windowManager;

  final Map<SubWindows, desktop_multi_window.WindowController> windows = {};

  Future<void> runApp(List<String> args) async {
    _initializeLogger();
    logger.info("------------------------------");
    logger.info("Starting new application... Args: ${args.firstOrNull}");

    if (args.firstOrNull == "multi_window") {
      logger.info(" - Starting sub window...");
      logger.info("   - Window ID: ${args[1]}");
      logger.info("   - Window Args: ${args[2]}");

      final window = dart_convert.jsonDecode(args[2])["window"];

      logger.info("   - Window: $window");

      if (window == "SubWindows.eewMonitorDisplay") {
        logger.info("   - Starting EEW Monitor Display Window...");
        await EewMonitorDisplay().main();
      } else if (window == "SubWindows.tsunamiMonitorDisplay") {
        logger.info("   - Starting Tsunami Monitor Display Window...");
        await TsunamiMonitorDisplay().main();
      } else if (window == "SubWindows.weatherEarthquakeTelopDisplay") {
        logger.info("   - Starting Weather Earthquake Telop Display Window...");
        await WeatherEarthquakeTelopDisplay().main();
      }
    } else {
      _runMainApp();
    }
  }

  void _initializeLogger() {
    logger = logging.Logger("logger");
    logging.Logger.root.level = logging.Level.ALL;
    logging.Logger.root.onRecord.listen((record) {
      print('${record.level.name}: ${record.time}: ${record.message}');
    });
  }

  Future<void> _runMainApp() async {
    logger.info(" - Starting Main application...");

    flutter.WidgetsFlutterBinding.ensureInitialized();

    config = YditsSscConfig();
    windowConfig = YditsSscWindowConfig(title: config.title);

    await _initializeDesktopWindow(windowConfig);

    windowManager = WindowManager(
        onFailedCloseWindow: (int windowId) => _onFailedCloseWindow(windowId));

    windows[SubWindows.eewMonitorDisplay] = await windowManager.createNewWindow(
      title: subWindowsTitle[SubWindows.eewMonitorDisplay] ?? "",
      window: SubWindows.eewMonitorDisplay,
    );
    windows[SubWindows.tsunamiMonitorDisplay] =
        await windowManager.createNewWindow(
      title: subWindowsTitle[SubWindows.tsunamiMonitorDisplay] ?? "",
      window: SubWindows.tsunamiMonitorDisplay,
    );
    windows[SubWindows.weatherEarthquakeTelopDisplay] =
        await windowManager.createNewWindow(
      title: subWindowsTitle[SubWindows.weatherEarthquakeTelopDisplay] ?? "",
      window: SubWindows.weatherEarthquakeTelopDisplay,
    );

    mainApp = YditsSscApp(
      config: config,
      windows: windows,
    );

    flutter.runApp(mainApp);
  }

  Future<void> _initializeDesktopWindow(
      YditsSscWindowConfig windowConfig) async {
    logger.info("   - Initializing Main app desktop window...");
    flutter.WidgetsFlutterBinding.ensureInitialized();
    await _setWindowConfig(windowConfig);
  }

  Future<void> _setWindowConfig(YditsSscWindowConfig windowConfig) async {
    logger.info("     - Setting Main app window config...");
    logger.info("       - Platform is desktop: $_isPlatformDesktop");

    if (!_isPlatformDesktop) return;

    window_size.setWindowTitle(windowConfig.title);
    window_size.setWindowFrame(windowConfig.windowFrame);
    window_size.setWindowMinSize(windowConfig.windowMinSize);
    window_size.setWindowMaxSize(windowConfig.windowMaxSize);

    final info = await window_size.getCurrentScreen();
    mainWindowFrame = info?.frame;
    logger.info(mainWindowFrame);
  }

  bool get _isPlatformMobile {
    return dart_io.Platform.isAndroid || dart_io.Platform.isIOS;
  }

  bool get _isPlatformDesktop {
    return dart_io.Platform.isWindows ||
        dart_io.Platform.isLinux ||
        dart_io.Platform.isMacOS;
  }

  void _onFailedCloseWindow(int windowId) {
    logger.warning("------------------------------------------------");
    logger.warning("Failed to close the window: windowId `$windowId`");
    logger.warning("------------------------------------------------");
  }
}
