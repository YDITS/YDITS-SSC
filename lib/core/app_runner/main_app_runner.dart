//
// YDITS for SSC
//
// Copyright (C) よね/Yone
//
// https://github.com/YDITS/YDITS-SSC
//

import 'dart:io';

import 'package:logging/logging.dart';
import 'package:desktop_multi_window/desktop_multi_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:window_size/window_size.dart';
import "package:configure/configure.dart";

import 'package:ydits_ssc/core/window_manager/window_manager.dart';
import 'package:ydits_ssc/core/sub_windows/sub_windows_enum.dart';
import 'package:ydits_ssc/core/sub_windows/sub_windows_title.dart';

/// メインアプリケーションの実行管理
abstract class MainAppRunner {
  MainAppRunner({required this.windowConfig, this.logger});

  /// メインアプリケーションウィンドウの構成
  final WindowConfig windowConfig;

  /// Loggerインスタンス
  final Logger? logger;

  /// アプリケーションウィジェット
  late final Widget app;

  /// メインウィンドウのフレームデータ
  late final Rect? windowFrame;

  /// サブウィンドウを保持するMap
  late final Map<SubWindows, WindowController> subWindows;

  /// アプリケーションを実行する
  Future<void> run() async {
    final subWindows = await configureSubWindows();

    logger?.info("Starting Main application...");

    WidgetsFlutterBinding.ensureInitialized();

    await initializeDesktopWindow();

    runApp(ProviderScope(child: app));
  }

  /// メインアプリケーションのウィンドウをイニシャライズする
  Future<void> initializeDesktopWindow() async {
    logger?.info("Initializing Main app desktop window...");
    WidgetsFlutterBinding.ensureInitialized();
    await _setWindowConfig();
  }

  /// メインアプリケーションのウィンドウ構成を設定する
  Future<void> _setWindowConfig() async {
    logger?.info("Setting Main app window config...");

    final isPlatformDesktop =
        Platform.isLinux | Platform.isMacOS | Platform.isWindows;

    logger?.info("Platform is desktop: ${isPlatformDesktop.toString()}");

    if (!isPlatformDesktop) {
      return;
    }

    setWindowTitle(windowConfig.title);
    setWindowFrame(windowConfig.frame);
    setWindowMinSize(windowConfig.minSize);
    setWindowMaxSize(windowConfig.maxSize);

    final info = await getCurrentScreen();
    windowFrame = info?.frame;
    logger?.info(windowFrame);
  }

  /// サブウィンドウをイニシャライズする
  Future<Map<SubWindows, WindowController>> configureSubWindows() async {
    final subWindowManager = WindowManager(
      onFailedCloseWindow: (int windowId) => onFailedCloseWindow(windowId),
    );

    final WindowController eewMonitorDisplayWindow = await subWindowManager
        .createNewWindow(
          title: subWindowsTitle[SubWindows.eewMonitorDisplay] ?? "",
          window: SubWindows.eewMonitorDisplay,
        );
    final WindowController tsunamiMonitorDisplayWindow = await subWindowManager
        .createNewWindow(
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
  }

  /// ウィンドウのクローズに失敗したときの処理
  void onFailedCloseWindow(int windowId) {
    logger?.warning("Failed to close the sub window | windowId: `$windowId`");
  }
}
