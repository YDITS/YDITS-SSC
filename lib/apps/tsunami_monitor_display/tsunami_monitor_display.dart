//
// YDITS for SSC
//
// Copyright (C) よね/Yone
//
// https://github.com/YDITS/YDITS-SSC
//

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';
import 'package:window_manager/window_manager.dart';
import 'package:flutter/material.dart';
import 'package:ydits_ssc/apps/tsunami_monitor_display/provider/tsunami_monitor_display_config_provider.dart';
import 'package:ydits_ssc/core/providers/logger/notifier/logger_notifier.dart';

import 'package:ydits_ssc/core/utils/is_platform_desktop.dart';
import 'package:ydits_ssc/apps/tsunami_monitor_display/widget/tsunami_monitor_display_app.dart';
import 'package:ydits_ssc/apps/tsunami_monitor_display/model/tsunami_monitor_display_config.dart';

/// Tsunami Monitor Display
final class TsunamiMonitorDisplay {
  TsunamiMonitorDisplay({required this.container}) {
    logger = container.read(loggerNotifierProvider);
    config = container.read(tsunamiMonitorDisplayAppConfigProvider);
    windowConfig = container.read(tsunamiMonitorDisplayWindowConfigProvider);
  }

  /// ProviderContainer インスタンス
  final ProviderContainer container;

  /// Logger インスタンス
  late final Logger? logger;

  /// TsunamiMonitorDisplayAppConfig インスタンス
  late final TsunamiMonitorDisplayAppConfig config;

  /// TsunamiMonitorDisplayWindowConfig インスタンス
  late final TsunamiMonitorDisplayWindowConfig windowConfig;

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
        child: const TsunamiMonitorDisplayApp(),
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
    logger?.info("Setting TsunamiMonitorDisplay application window configs...");

    logger?.info(
      isPlatformDesktop
          ? "Desktop platform detected."
          : "Non-desktop platform detected. Window configuration will be skipped.",
    );

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
      "TsunamiMonitorDisplay application window options: ${windowOptions.toString()}",
    );

    windowManager.waitUntilReadyToShow(
      windowOptions,
      () async => await onReadyToShowWindow(),
    );
  }

  /// ウィンドウの表示が可能になったときの処理
  Future<void> onReadyToShowWindow() async {
    await windowManager.show();
    await windowManager.focus();
  }
}
