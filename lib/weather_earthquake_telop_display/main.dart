//
// YDITS for SSC
//
// Copyright (C) よね/Yone
//
// https://github.com/YDITS/YDITS-SSC
//

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:ydits_ssc/weather_earthquake_telop_display/widgets/app.dart';
import 'package:window_size/window_size.dart';
import 'package:ydits_ssc/weather_earthquake_telop_display/config.dart';

void main() async {
  initializeDesktopWindow();

  runApp(
    const App(),
  );
}

void initializeDesktopWindow() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (isPlatformDesktop()) {
    setWindowTitle(Config.windowTitle);
    setWindowFrame(Config.windowFrame);
    setWindowMinSize(Config.windowMinSize);
    setWindowMaxSize(Config.windowMaxSize);

    final info = await getCurrentScreen();
    print(info?.frame);
  }
}

bool isPlatformDesktop() {
  return Platform.isWindows || Platform.isLinux || Platform.isMacOS;
}