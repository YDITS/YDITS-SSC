//
// YDITS for SSC
//
// Copyright (C) よね/Yone
//
// https://github.com/YDITS/YDITS-SSC
//

import 'package:flutter/material.dart';
import 'package:desktop_multi_window/desktop_multi_window.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ydits_ssc/core/sub_windows/sub_windows_enum.dart';
import 'package:ydits_ssc/features/main_app_home/widget/main_app_home.dart';

/// YDITS for SSC メインアプリケーション
final class YditsSscMainApp extends ConsumerWidget {
  const YditsSscMainApp({
    super.key,
    required this.subWindows,
  });

  final Map<SubWindows, WindowController> subWindows;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      home: YditsSscMainAppHomePage(windows: subWindows),
    );
  }
}
