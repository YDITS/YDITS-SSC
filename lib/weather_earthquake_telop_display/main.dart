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
import 'package:ydits_ssc/weather_earthquake_telop_display/app.dart';
import 'package:ydits_ssc/weather_earthquake_telop_display/config.dart';

final logger = Logger('Logger');

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  initializeLogger();

  await initializeDesktopWindow();

  runApp(
    App(logger: logger),
  );
}

void initializeLogger() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((record) {
    print('${record.level.name}: ${record.time}: ${record.message}');
  });
}

initializeDesktopWindow() async {
  final frame = await setWindowConfig();
  return frame;
}

setWindowConfig() async {
  if (!isPlatformDesktop()) {
    return;
  }

  setWindowTitle(Config.windowTitle);
  setWindowFrame(Config.windowFrame);
  setWindowMinSize(Config.windowMinSize);
  setWindowMaxSize(Config.windowMaxSize);

  final info = await getCurrentScreen();

  logger.info(info?.frame);

  return info?.frame;
}

bool isPlatformDesktop() {
  return Platform.isWindows || Platform.isLinux || Platform.isMacOS;
}
