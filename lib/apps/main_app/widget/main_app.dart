//
// YDITS for SSC
//
// Copyright (C) よね/Yone
//
// https://github.com/YDITS/YDITS-SSC
//

import 'package:desktop_multi_window/desktop_multi_window.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:version/version.dart';
import 'package:ydits_ssc/apps/main_app/provider/main_app_config_provider.dart';
import 'package:ydits_ssc/core/providers/constants/build_mode_to_bannar_text/build_mode_to_banner_text_provider.dart';
import 'package:ydits_ssc/core/providers/weather_timer/notifier/weather_timer_notifier.dart';
import 'package:ydits_ssc/core/sub_windows/sub_windows.dart';
import 'package:ydits_ssc/features/main_app_home/widget/main_app_home.dart';

/// The main application widget for YDITS for SSC.
class YditsSscMainApp extends ConsumerStatefulWidget {
  const YditsSscMainApp({required this.subWindows, super.key});

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
    final VersionLevels buildMode =
        ref.watch(yditsSscAppConfigProvider).version.level;
    final bool isStable = buildMode == VersionLevels.stable;

    Widget home = YditsSscMainAppHomePage(windows: widget.subWindows);

    if (!isStable) {
      final String buildModeBannerText =
          ref.read(buildModeToBannarTextProvider)[buildMode] ?? '';
      home = Banner(
        message: buildModeBannerText,
        location:
            kReleaseMode ? BannerLocation.topEnd : BannerLocation.bottomEnd,
        child: home,
      );
    }

    return MaterialApp(home: home);
  }
}
