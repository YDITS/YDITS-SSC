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
import 'package:ydits_ssc/core/providers/weather_timer/notifier/weather_timer_notifier.dart';
import 'package:ydits_ssc/core/sub_windows/sub_windows.dart';
import 'package:ydits_ssc/features/main_app_home/widget/main_app_home.dart';

/// YDITS for SSC メインアプリケーション
final class YditsSscMainApp extends ConsumerStatefulWidget {
  const YditsSscMainApp({super.key, required this.subWindows});

  /// サブウィンドウを保持するマップ
  final Map<SubWindows, WindowController> subWindows;

  @override
  ConsumerState<YditsSscMainApp> createState() => _YditsSscMainAppState();
}

/// YDITS for SSC メインアプリケーションの状態クラス
final class _YditsSscMainAppState extends ConsumerState<YditsSscMainApp> {
  @override
  void initState() {
    super.initState();

    // Avoid modifying provider during widget lifecycle.
    // This executes the provider update after the widget tree has been built.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _startWeatherTimer();
    });
  }

  /// 天気を処理するタイマーを開始する
  void _startWeatherTimer() {
    ref.read(weatherTimerProvider.notifier).start();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: YditsSscMainAppHomePage(windows: widget.subWindows),
    );
  }
}
