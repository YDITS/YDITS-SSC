//
// YDITS for SSC
//
// Copyright (C) よね/Yone
//
// https://github.com/YDITS/YDITS-SSC
//

import 'dart:io' as dart_io;
import 'package:logging/logging.dart' as logging;
import 'package:window_size/window_size.dart' as window_size;
import 'package:flutter/material.dart' as flutter;

import 'packages/window_manager/window_manager.dart';
import 'app.dart';
import 'config.dart';

class YditsSsc {
  late final YditsSscConfig config;
  late final YditsSscWindowConfig windowConfig;
  late final logging.Logger logger;
  late final dynamic mainWindowFrame;
  late final YditsSscApp mainApp;
  late final WindowManager windowManager;

  void runApp() async {
    config = YditsSscConfig();
    windowConfig = YditsSscWindowConfig(title: config.title);

    initializeLogger();

    await initializeDesktopWindow(windowConfig);

    mainApp = YditsSscApp(
      config: config,
    );

    windowManager = WindowManager(onFailedCloseWindow: (int windowId) { onFailedCloseWindow(windowId); });

    flutter.runApp(mainApp);
  }

  void initializeLogger() {
    logger = logging.Logger('Logger');
    logging.Logger.root.level = logging.Level.ALL;
    logging.Logger.root.onRecord.listen((record) {
      print('${record.level.name}: ${record.time}: ${record.message}');
    });
  }

  Future<void> initializeDesktopWindow(
      YditsSscWindowConfig windowConfig) async {
    flutter.WidgetsFlutterBinding.ensureInitialized();
    await setWindowConfig(windowConfig);
  }

  Future<void> setWindowConfig(YditsSscWindowConfig windowConfig) async {
    if (!isPlatformDesktop) return;

    window_size.setWindowTitle(windowConfig.title);
    window_size.setWindowFrame(windowConfig.windowFrame);
    window_size.setWindowMinSize(windowConfig.windowMinSize);
    window_size.setWindowMaxSize(windowConfig.windowMaxSize);

    final info = await window_size.getCurrentScreen();
    mainWindowFrame = info?.frame;
    logger.info(mainWindowFrame);
  }

  bool get isPlatformMobile {
    return dart_io.Platform.isAndroid || dart_io.Platform.isIOS;
  }

  bool get isPlatformDesktop {
    return dart_io.Platform.isWindows ||
        dart_io.Platform.isLinux ||
        dart_io.Platform.isMacOS;
  }

  void onFailedCloseWindow(int windowId) {
    logger.warning("Failed to close the window: windowId `$windowId`");
  }
}
