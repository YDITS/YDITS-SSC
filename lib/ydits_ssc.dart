//
// YDITS for SSC
//
// Copyright (C) よね/Yone
//
// https://github.com/YDITS/YDITS-SSC
//

import 'dart:io' as dart_io;
import 'dart:ui' as dart_ui;
import 'package:desktop_multi_window/desktop_multi_window.dart';
import 'package:logging/logging.dart' as logging;
import 'package:window_size/window_size.dart' as window_size;
import 'package:flutter/material.dart' as flutter;

import 'package:ydits_ssc/core/window_manager/window_manager.dart';
import 'package:ydits_ssc/core/sub_windows/sub_windows.dart';
import 'package:ydits_ssc/core/sub_windows/sub_windows_title.dart';
import 'package:ydits_ssc/app.dart';
import 'package:ydits_ssc/config.dart';

class YditsSsc {
  late final YditsSscConfig config;
  late final YditsSscWindowConfig windowConfig;
  late final logging.Logger logger;
  late final dart_ui.Rect? mainWindowFrame;
  late final YditsSscApp mainApp;
  late final WindowManager windowManager;
  late final Map<SubWindows, WindowController> windows;

  void runApp() async {
    config = YditsSscConfig();
    windowConfig = YditsSscWindowConfig(title: config.title);

    _initializeLogger();

    await _initializeDesktopWindow(windowConfig);

    windowManager = WindowManager(
      onFailedCloseWindow: (int windowId) => _onFailedCloseWindow(windowId)
    );

    windows[SubWindows.eewMonitorDisplay] = await windowManager.createNewWindow(title: subWindowsTitle[SubWindows.eewMonitorDisplay] ?? "");
    windows[SubWindows.tsunamiMonitorDisplay] = await windowManager.createNewWindow(title: subWindowsTitle[SubWindows.tsunamiMonitorDisplay] ?? "");
    windows[SubWindows.weatherEarthquakeTelopDisplay] = await windowManager.createNewWindow(title: subWindowsTitle[SubWindows.weatherEarthquakeTelopDisplay] ?? "");

    mainApp = YditsSscApp(
      config: config,
      windows: windows,
    );

    flutter.runApp(mainApp);
  }

  void _initializeLogger() {
    logger = logging.Logger('Logger');
    logging.Logger.root.level = logging.Level.ALL;
    logging.Logger.root.onRecord.listen((record) {
      print('${record.level.name}: ${record.time}: ${record.message}');
    });
  }

  Future<void> _initializeDesktopWindow(
      YditsSscWindowConfig windowConfig
  ) async {
    flutter.WidgetsFlutterBinding.ensureInitialized();
    await _setWindowConfig(windowConfig);
  }

  Future<void> _setWindowConfig(
    YditsSscWindowConfig windowConfig
  ) async {
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
    logger.warning("Failed to close the window: windowId `$windowId`");
  }
}
