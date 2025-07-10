//
// YDITS for SSC
//
// Copyright (C) よね/Yone
//
// https://github.com/YDITS/YDITS-SSC
//

import 'package:desktop_multi_window/desktop_multi_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:ydits_ssc/core/providers/weather_timer/notifier/weather_timer_notifier.dart';
import 'package:ydits_ssc/core/sub_windows/sub_windows.dart';
import 'package:ydits_ssc/features/main_app_home/widget/main_app_home.dart';

/// The main application widget for YDITS for SSC.
class YditsSscMainApp extends ConsumerStatefulWidget {
  const YditsSscMainApp({super.key, required this.subWindows});

  /// A map holding the controllers for all sub-windows.
  final Map<SubWindows, WindowController> subWindows;

  @override
  ConsumerState<YditsSscMainApp> createState() => _YditsSscMainAppState();
}

/// YDITS for SSC メインアプリケーションの状態クラス
final class _YditsSscMainAppState extends ConsumerState<YditsSscMainApp> {
  @override
  void initState() {
    super.initState();

    // Schedules a callback for the end of this frame to start the weather timer.
    // This avoids modifying a provider during the widget build phase.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _startWeatherTimer();
    });
  }

  /// Starts the timer that periodically fetches weather data.
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
