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
import 'package:ydits_ssc/apps/eew_monitor_display/model/eew_monitor_display_config.dart';
import 'package:ydits_ssc/apps/eew_monitor_display/widget/eew_monitor_display_app.dart';
import 'package:ydits_ssc/core/utils/is_platform_desktop.dart';

/// A class to manage the EEW (Earthquake Early Warning) Monitor Display window.
final class EewMonitorDisplay {
  EewMonitorDisplay({this.logger});

  /// An optional logger instance for logging application events.
  final Logger? logger;

  /// The window configuration for the EEW Monitor Display.
  final EEWMonitorDisplayWindowConfig windowConfig =
      EEWMonitorDisplayWindowConfig();

  /// Runs the EEW Monitor Display application.
  ///
  /// This method initializes the desktop window if on a desktop platform
  /// and then runs the Flutter application.
  Future<void> run() async {
    if (isPlatformDesktop) {
      try {
        await _initializeDesktopWindow();
      } catch (error, stackTrace) {
        logger?.warning(
          'Failed to initialize desktop window for EEW Monitor.',
          error,
          stackTrace,
        );
      }
    }

    runApp(const ProviderScope(child: EewMonitorDisplayApp()));
  }

  /// Initializes the desktop window.
  ///
  /// This method ensures that the necessary bindings are initialized and then
  /// proceeds to configure the window.
  Future<void> _initializeDesktopWindow() async {
    await _setWindowConfig();
  }

  /// Sets the window configuration based on [windowConfig].
  Future<void> _setWindowConfig() async {
    logger?.info('Setting EewMonitorDisplay application window configs...');
  }
}
