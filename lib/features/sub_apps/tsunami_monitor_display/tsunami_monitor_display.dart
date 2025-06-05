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

import 'package:ydits_ssc/features/sub_apps/tsunami_monitor_display/app.dart';
import 'package:ydits_ssc/features/sub_apps/tsunami_monitor_display/config.dart';

export 'package:ydits_ssc/features/sub_apps/tsunami_monitor_display/app.dart';
export 'package:ydits_ssc/features/sub_apps/tsunami_monitor_display/config.dart';
export 'package:ydits_ssc/features/sub_apps/tsunami_monitor_display/pages/pages.dart';

final class TsunamiMonitorDisplay {
  late final Logger logger;
  late final Rect? frame;
  late final TsunamiMonitorDisplayAppConfig config;
  late final TsunamiMonitorDisplayWindowConfig windowConfig;

  Future<void> main() async {
    initializeLogger();

    config = TsunamiMonitorDisplayAppConfig();
    windowConfig = TsunamiMonitorDisplayWindowConfig();

    try {
      await initializeDesktopWindow();
    } catch (error) {
      logger.warning(error);
    }

    runApp(const ProviderScope(
      child: TsunamiMonitorDisplayApp(),
    ));
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
    if (!isPlatformDesktop) {
      return;
    }

    setWindowTitle(windowConfig.title);
    setWindowFrame(windowConfig.frame);
    setWindowMinSize(windowConfig.minSize);
    setWindowMaxSize(windowConfig.maxSize);

    final info = await getCurrentScreen();
    frame = info?.frame;
    logger.info(frame);
  }

  bool get isPlatformDesktop {
    return Platform.isWindows || Platform.isLinux || Platform.isMacOS;
  }
}
