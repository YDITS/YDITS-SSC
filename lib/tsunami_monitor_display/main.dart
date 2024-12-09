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
import 'package:ydits_ssc/tsunami_monitor_display/app.dart';
import 'package:ydits_ssc/tsunami_monitor_display/config.dart';

void main() async {
  final log = Logger('Logger');
  initializeLogger();

  final frame = await initializeDesktopWindow();
  log.info(frame);

  runApp(
    const App(),
  );
}

void initializeLogger() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((record) {
    print('${record.level.name}: ${record.time}: ${record.message}');
  });
}

initializeDesktopWindow() async {
  WidgetsFlutterBinding.ensureInitialized();
  return await setWindowConfig();
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
  return info?.frame;
}

bool isPlatformDesktop() {
  return Platform.isWindows || Platform.isLinux || Platform.isMacOS;
}
