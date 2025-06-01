//
// YDITS for SSC
//
// Copyright (C) よね/Yone
//
// https://github.com/YDITS/YDITS-SSC
//

import 'package:flutter/material.dart';
import 'package:desktop_multi_window/desktop_multi_window.dart';
import "package:configure/configure.dart";

import 'package:ydits_ssc/core/sub_windows/sub_windows.dart';
import 'package:ydits_ssc/src/pages/pages.dart';

/// YDITS for SSC メインアプリケーション
final class YditsSscApp extends StatelessWidget {
  const YditsSscApp({
    super.key,
    required this.config,
    required this.windows,
  });

  final AppConfig config;
  final Map<SubWindows, WindowController> windows;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(
        title: config.title,
        windows: windows,
      ),
    );
  }
}
