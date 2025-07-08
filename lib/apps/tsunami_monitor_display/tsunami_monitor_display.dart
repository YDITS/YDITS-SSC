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
import 'package:ydits_ssc/apps/tsunami_monitor_display/model/tsunami_monitor_display_config.dart';
import 'package:ydits_ssc/apps/tsunami_monitor_display/widget/tsunami_monitor_display_app.dart';
import 'package:ydits_ssc/core/utils/is_platform_desktop.dart';

/// A class to manage the Tsunami Monitor Display window.
final class TsunamiMonitorDisplay {
  /// Creates an instance of [TsunamiMonitorDisplay].
  ///
  /// An optional [logger] can be provided for logging.
  TsunamiMonitorDisplay({this.logger});

  /// An optional logger instance for logging application events.
  final Logger? logger;

  /// The window configuration for the Tsunami Monitor Display.
  final TsunamiMonitorDisplayWindowConfig windowConfig =
      TsunamiMonitorDisplayWindowConfig();

  /// Runs the Tsunami Monitor Display application.
  ///
  /// This method initializes the desktop window if on a desktop platform
  /// and then runs the Flutter application.
  Future<void> run() async {
    if (isPlatformDesktop) {
      try {
        await _initializeDesktopWindow();
      } catch (error, stackTrace) {
        logger?.warning(
          'Failed to initialize desktop window for Tsunami Monitor.',
          error,
          stackTrace,
        );
      }
    }

    runApp(const ProviderScope(child: TsunamiMonitorDisplayApp()));
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
    logger?.info('Setting TsunamiMonitorDisplay application window configs...');

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
      'TsunamiMonitorDisplay application window options: $windowOptions',
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
    logger?.info('Tsunami Monitor Display window is now visible.');
  }
}
