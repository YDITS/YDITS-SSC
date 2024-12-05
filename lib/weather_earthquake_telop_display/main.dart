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

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    setWindowTitle('YDITS for SSC - Weather Earthquake Telop Display');
    setWindowFrame(const Rect.fromLTWH(128, 128, 960, 128));
    setWindowMinSize(const Size(640, 128));
    setWindowMaxSize(const Size(960, 128));

    final info = await getCurrentScreen();
    print(info?.frame);
  }

  runApp(
    const App(),
  );
}
