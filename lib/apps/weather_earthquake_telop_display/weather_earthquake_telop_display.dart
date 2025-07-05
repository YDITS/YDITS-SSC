//
// YDITS for SSC
//
// Copyright (C) よね/Yone
//
// https://github.com/YDITS/YDITS-SSC
//

import 'package:logging/logging.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';
import 'package:ydits_ssc/apps/weather_earthquake_telop_display/provider/weather_earthquake_telop_display_config_provider.dart';
import 'package:ydits_ssc/core/providers/logger/notifier/logger_notifier.dart';

import 'package:ydits_ssc/core/utils/is_platform_desktop.dart';
import 'package:ydits_ssc/apps/weather_earthquake_telop_display/widget/weather_earthquake_telop_display_app.dart';
import 'package:ydits_ssc/apps/weather_earthquake_telop_display/model/weather_earthquake_telop_display_config.dart';

/// Weather Earthquake Telop Display
class WeatherEarthquakeTelopDisplay {
  WeatherEarthquakeTelopDisplay({required this.container}) {
    logger = container.read(loggerNotifierProvider);
    config = container.read(weatherEarthquakeTelopDisplayConfigProvider);
    appConfig = container.read(weatherEarthquakeTelopDisplayAppConfigProvider);
    windowConfig = container.read(weatherEarthquakeTelopDisplayWindowConfigProvider);
  }

  /// ProviderContainer インスタンス
  final ProviderContainer container;

  /// Logger インスタンス
  late final Logger? logger;

  /// WeatherEarthquakeTelopDisplayConfig インスタンス
  late final WeatherEarthquakeTelopDisplayConfig config;

  /// WeatherEarthquakeTelopDisplayAppConfig インスタンス
  late final WeatherEarthquakeTelopDisplayAppConfig appConfig;
  
  /// WeatherEarthquakeTelopDisplayWindowConfig インスタンス
  late final WeatherEarthquakeTelopDisplayWindowConfig windowConfig;

  /// アプリケーションを実行する
  Future<void> main() async {
    try {
      await initializeDesktopWindow();
    } catch (error) {
      logger?.warning(error);
    }

    runApp(
      UncontrolledProviderScope(
        container: container,
        child: const WeatherEarthquakeTelopDisplayApp(),
      ),
    );
  }

  /// ウィンドウをイニシャライズする
  Future<void> initializeDesktopWindow() async {
    WidgetsFlutterBinding.ensureInitialized();
    windowManager.ensureInitialized();
    return await setWindowConfig();
  }

  /// ウィンドウの構成を設定する
  Future<void> setWindowConfig() async {
    logger?.info(
      "Setting WeatherEarthquakeTelopDisplay application window configs...",
    );
    logger?.info("Platform is desktop: ${isPlatformDesktop.toString()}");

    if (!isPlatformDesktop) {
      return;
    }

    WindowOptions windowOptions = WindowOptions(
      title: windowConfig.title,
      size: windowConfig.initialSize,
      minimumSize: windowConfig.minSize,
      maximumSize: windowConfig.maxSize,
      center: true,
      fullScreen: false,
      alwaysOnTop: false,
      skipTaskbar: false,
      titleBarStyle: TitleBarStyle.normal,
      windowButtonVisibility: true,
    );

    logger?.info(
      "WeatherEarthquakeTelopDisplay application window options: ${windowOptions.toString()}",
    );

    windowManager.waitUntilReadyToShow(windowOptions, () async => await onReadyToShowWindow());
  }

  /// ウィンドウの表示が可能になったときの処理
  Future<void> onReadyToShowWindow() async {
    await windowManager.show();
    await windowManager.focus();
  }
}
