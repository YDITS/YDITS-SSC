//
// YDITS for SSC
//
// Copyright (C) よね/Yone
//
// https://github.com/YDITS/YDITS-SSC
//

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';
import 'package:window_manager/window_manager.dart';
import 'package:flutter/material.dart';

import 'package:ydits_ssc/core/utils/is_platform_desktop.dart';
import 'package:ydits_ssc/features/sub_apps/eew_monitor_display/app.dart';
import 'package:ydits_ssc/features/sub_apps/eew_monitor_display/config.dart';

final class EewMonitorDisplay {
  late final Logger logger;
  late final Rect? frame;
  late final EEWMonitorDisplayAppConfig config;
  late final EEWMonitorDisplayWindowConfig windowConfig;

  Future<void> main() async {
    initializeLogger();

    config = EEWMonitorDisplayAppConfig();
    windowConfig = EEWMonitorDisplayWindowConfig();

    try {
      await initializeDesktopWindow();
    } catch (error) {
      logger.warning(error);
    }

    runApp(const ProviderScope(child: EewMonitorDisplayApp()));
  }

  void initializeLogger() {
    logger = Logger('Logger');
    Logger.root.level = Level.ALL;
    Logger.root.onRecord.listen((record) {
      print('${record.level.name}: ${record.time}: ${record.message}');
    });
  }

  Future<void> initializeDesktopWindow() async {
    WidgetsFlutterBinding.ensureInitialized();
    return await setWindowConfig();
  }

  Future<void> setWindowConfig() async {
    logger.info("Setting EewMonitorDisplay application window configs...");
    logger.info("Platform is desktop: ${isPlatformDesktop.toString()}");

    if (!isPlatformDesktop) {
      return;
    }

    WindowOptions windowOptions = WindowOptions(
      title: windowConfig.title,
      size: windowConfig.initialSize,
      minimumSize: windowConfig.minSize,
      maximumSize: windowConfig.maxSize,
      center: true,
      fullScreen: false,
      alwaysOnTop: false,
      skipTaskbar: false,
      titleBarStyle: TitleBarStyle.normal,
      windowButtonVisibility: true,
    );

    logger.info(
      "EewMonitorDisplay application window options: ${windowOptions.toString()}",
    );

    windowManager.waitUntilReadyToShow(windowOptions, () async {
      await windowManager.show();
      await windowManager.focus();
    });
  }
}
