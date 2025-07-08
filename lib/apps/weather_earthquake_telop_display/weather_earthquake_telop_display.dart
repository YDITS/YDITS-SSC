//
// YDITS for SSC
//
// Copyright (C) よね/Yone
//
// https://github.com/YDITS/YDITS-SSC
//

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';
import 'package:window_manager/window_manager.dart';
import 'package:ydits_ssc/apps/weather_earthquake_telop_display/model/weather_earthquake_telop_display_config.dart';
import 'package:ydits_ssc/apps/weather_earthquake_telop_display/widget/weather_earthquake_telop_display_app.dart';
import 'package:ydits_ssc/core/utils/is_platform_desktop.dart';

/// A class to manage the Weather Earthquake Telop Display window.
class WeatherEarthquakeTelopDisplay {
  WeatherEarthquakeTelopDisplay({this.logger});

  /// An optional logger instance for logging application events.
  final Logger? logger;

  /// The window configuration for the Weather Earthquake Telop Display.
  final WeatherEarthquakeTelopDisplayWindowConfig windowConfig =
      WeatherEarthquakeTelopDisplayWindowConfig();

  /// Runs the Weather Earthquake Telop Display application.
  ///
  /// This method initializes the desktop window if on a desktop platform
  /// and then runs the Flutter application.
  Future<void> run() async {
    if (isPlatformDesktop) {
      try {
        await _initializeDesktopWindow();
      } catch (error, stackTrace) {
        logger?.warning(
          'Failed to initialize desktop window for Weather Telop.',
          error,
          stackTrace,
        );
      }
    }

    runApp(const ProviderScope(child: WeatherEarthquakeTelopDisplayApp()));
  }

  /// Initializes the desktop window.
  ///
  /// This method ensures that the necessary bindings are initialized and then
  /// proceeds to configure the window.
  Future<void> _initializeDesktopWindow() async {
    WidgetsFlutterBinding.ensureInitialized();
    await windowManager.ensureInitialized();
    await _setWindowConfig();
  }

  /// Sets the window configuration based on [windowConfig].
  Future<void> _setWindowConfig() async {
    logger?.info(
      'Setting WeatherEarthquakeTelopDisplay application window configs...',
    );

    final windowOptions = WindowOptions(
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
      'WeatherEarthquakeTelopDisplay application window options: $windowOptions',
    );

    windowManager.waitUntilReadyToShow(
      windowOptions,
      () async => _onReadyToShowWindow(),
    );
  }

  /// Handles the event when the window is ready to be shown.
  Future<void> _onReadyToShowWindow() async {
    await windowManager.show();
    await windowManager.focus();
    logger?.info('Weather Earthquake Telop Display window is now visible.');
  }
}
