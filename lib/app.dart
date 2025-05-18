//
// YDITS for SSC
//
// Copyright (C) よね/Yone
//
// https://github.com/YDITS/YDITS-SSC
//

import 'package:flutter/material.dart' as flutter;
import 'package:desktop_multi_window/desktop_multi_window.dart' as desktop_multi_window;
import 'package:ydits_ssc/config.dart';
import 'package:ydits_ssc/core/sub_windows/sub_windows.dart';
import 'package:ydits_ssc/pages/pages.dart';

class YditsSscApp extends flutter.StatelessWidget {
  const YditsSscApp({
    super.key,
    required this.config,
    required this.windows,
  });

  final YditsSscConfig config;
  final Map<SubWindows, desktop_multi_window.WindowController> windows;

  @override
  flutter.Widget build(flutter.BuildContext context) {
    return flutter.MaterialApp(
      home: HomePage(
        title: config.title,
        windows: windows,
      ),
    );
  }
}
