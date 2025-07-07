//
// YDITS for SSC
//
// Copyright (C) よね/Yone
//
// https://github.com/YDITS/YDITS-SSC
//

import 'package:logging/logging.dart';
import 'package:desktop_multi_window/desktop_multi_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:window_manager/window_manager.dart';
import "package:configure/configure.dart";
import 'package:ydits_ssc/core/exceptions/exceptions.dart';

import 'package:ydits_ssc/core/utils/is_platform_desktop.dart';
import 'package:ydits_ssc/core/window_manager/window_manager.dart';
import 'package:ydits_ssc/core/window_manager/window_manager_exceptions.dart';
import 'package:ydits_ssc/core/sub_windows/sub_windows.dart';

/// メインアプリケーションの実行管理
abstract class MainAppRunner {
  MainAppRunner({this.logger});

  /// アプリケーションウィジェット
  late final Widget app;

  /// メインアプリケーションウィンドウの構成
  abstract final WindowConfig windowConfig;

  /// サブウィンドウを保持するMap
  late Map<SubWindows, WindowController> subWindows;

  /// Loggerインスタンス
  final Logger? logger;

  /// アプリケーションを実行する
  Future<void> run() async {

    logger?.info("Running main application...");

    try {
      subWindows = await configureSubWindows();
    } catch (error) {
      logger?.warning(error);
    }

    try {
      await initializeDesktopWindow();
    } catch (error) {
      logger?.warning(error);
    }

    runApp(ProviderScope(child: app));
  }

  /// メインアプリケーションのウィンドウをイニシャライズする
  Future<void> initializeDesktopWindow() async {
    logger?.info("Initializing main application window...");
    
    try {
      await windowManager.ensureInitialized();
      await _setWindowConfig();
    } catch (error) {
      throw MainWindowInitializationFailed(error);
    }
  }

  /// メインアプリケーションのウィンドウ構成を設定する
  Future<void> _setWindowConfig() async {
    logger?.info("Setting main application window configs...");
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
      "Main application window options: ${windowOptions.toString()}",
    );

    windowManager.waitUntilReadyToShow(windowOptions, () async {
      await windowManager.show();
      await windowManager.focus();
    });
  }

  /// サブウィンドウをイニシャライズする
  Future<Map<SubWindows, WindowController>> configureSubWindows() async {
    logger?.info("Configuration sub application windows...");

    try {
      final subWindowManager = YditsSscWindowManager(
        onFailedCloseWindowCallback:
            (int windowId) => onFailedCloseWindow(windowId),
      );

      final WindowController eewMonitorDisplayWindow = await subWindowManager
          .createNewWindow(
            title: subWindowsTitle[SubWindows.eewMonitorDisplay] ?? "",
            window: SubWindows.eewMonitorDisplay,
          );
      final WindowController tsunamiMonitorDisplayWindow =
          await subWindowManager.createNewWindow(
            title: subWindowsTitle[SubWindows.tsunamiMonitorDisplay] ?? "",
            window: SubWindows.tsunamiMonitorDisplay,
          );
      final WindowController weatherEarthquakeTelopDisplayWindow =
          await subWindowManager.createNewWindow(
            title:
                subWindowsTitle[SubWindows.weatherEarthquakeTelopDisplay] ?? "",
            window: SubWindows.weatherEarthquakeTelopDisplay,
          );

      return {
        SubWindows.eewMonitorDisplay: eewMonitorDisplayWindow,
        SubWindows.tsunamiMonitorDisplay: tsunamiMonitorDisplayWindow,
        SubWindows.weatherEarthquakeTelopDisplay:
            weatherEarthquakeTelopDisplayWindow,
      };
    } catch (error) {
      throw SubWindowsInitializationFailed(error);
    }
  }

  /// ウィンドウのクローズに失敗したときの処理
  void onFailedCloseWindow(int windowId) {
    logger?.warning(
      WindowCloseFailed(
        "Failed to close the sub window | Window ID: `${windowId.toString()}`",
      ),
    );
  }
}
