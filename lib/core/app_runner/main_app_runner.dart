//
// YDITS for SSC
//
// Copyright (C) よね/Yone
//
// https://github.com/YDITS/YDITS-SSC
//

import 'package:configure/configure.dart';
import 'package:desktop_multi_window/desktop_multi_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';
import 'package:ydits_ssc/core/exceptions/exceptions.dart';
import 'package:ydits_ssc/core/sub_windows/sub_windows.dart';
import 'package:ydits_ssc/core/utils/is_platform_desktop.dart';
import 'package:ydits_ssc/core/window_manager/window_manager.dart';
import 'package:ydits_ssc/core/window_manager/window_manager_exceptions.dart';

/// An abstract class for managing the execution of the main application.
///
/// This class handles the initialization of the main window, configuration of
/// sub-windows, and running the main application widget.
abstract class MainAppRunner {
  MainAppRunner({this.logger});

  /// The main application widget to be run.
  late final Widget app;

  /// The configuration for the main application window.
  abstract final WindowConfig windowConfig;

  /// A map to hold the controllers for all sub-windows.
  late Map<SubWindows, WindowController> subWindows;

  /// An optional logger instance for logging application events.
  final Logger? logger;

  /// Runs the main application.
  ///
  /// This method configures sub-windows, initializes the main desktop window,
  /// and then runs the application.
  Future<void> run() async {
    logger?.info('Running main application...');

    try {
      subWindows = await configureSubWindows();
    } catch (error, stackTrace) {
      logger?.warning('Failed to configure sub-windows.', error, stackTrace);
    }

    if (isPlatformDesktop) {
      try {
        await initializeDesktopWindow();
      } catch (error, stackTrace) {
        logger?.warning(
          'Failed to initialize the main desktop window.',
          error,
          stackTrace,
        );
      }
    }

    runApp(ProviderScope(child: app));
  }

  /// Initializes the main application window.
  Future<void> initializeDesktopWindow() async {
    logger?.info('Initializing main application window...');

    try {
      await _setWindowConfig();
    } catch (error) {
      throw MainWindowInitializationFailed(error);
    }
  }

  /// Sets the configuration for the main application window.
  Future<void> _setWindowConfig() async {
    logger?.info('Setting main application window configs...');
  }

  /// Configures and creates all sub-windows.
  Future<Map<SubWindows, WindowController>> configureSubWindows() async {
    logger?.info('Configuring sub-application windows...');

    try {
      final YditsSscWindowManager subWindowManager = YditsSscWindowManager(
        onFailedCloseWindowCallback:
            (int windowId) => _onFailedCloseWindow(windowId),
      );

      final WindowController eewMonitorDisplayWindow = await subWindowManager
          .createNewWindow(
            title: subWindowsTitle[SubWindows.eewMonitorDisplay] ?? '',
            window: SubWindows.eewMonitorDisplay,
          );
      final WindowController tsunamiMonitorDisplayWindow =
          await subWindowManager.createNewWindow(
            title: subWindowsTitle[SubWindows.tsunamiMonitorDisplay] ?? '',
            window: SubWindows.tsunamiMonitorDisplay,
          );
      final WindowController weatherEarthquakeTelopDisplayWindow =
          await subWindowManager.createNewWindow(
            title:
                subWindowsTitle[SubWindows.weatherEarthquakeTelopDisplay] ?? '',
            window: SubWindows.weatherEarthquakeTelopDisplay,
          );

      return <SubWindows, WindowController>{
        SubWindows.eewMonitorDisplay: eewMonitorDisplayWindow,
        SubWindows.tsunamiMonitorDisplay: tsunamiMonitorDisplayWindow,
        SubWindows.weatherEarthquakeTelopDisplay:
            weatherEarthquakeTelopDisplayWindow,
      };
    } catch (error) {
      throw SubWindowsInitializationFailed(error);
    }
  }

  /// Callback for when a sub-window fails to close.
  void _onFailedCloseWindow(int windowId) {
    logger?.warning(
      WindowCloseException(
        'Failed to close the sub window | Window ID: `${windowId.toString()}`',
      ),
    );
  }
}
