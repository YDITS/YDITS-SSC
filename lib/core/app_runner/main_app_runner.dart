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

import 'package:ydits_ssc/core/core.dart';

/// メインアプリケーションの実行管理
abstract class MainAppRunner {
  MainAppRunner({
    required this.app,
    required this.windowConfig,
    this.logger,
  });

  /// アプリケーションウィジェット
  final Widget app;

  /// メインアプリケーションウィンドウの構成
  final WindowConfig windowConfig;

  /// Loggerインスタンス
  final Logger? logger;

  /// メインウィンドウのフレームデータ
  late final Rect? windowFrame;

  /// サブウィンドウを保持するMap
  late final Map<SubWindows, WindowController> subWindows;

  /// アプリケーションを実行する
  Future<void> run() async {
    logger?.info("Starting Main application...");

    WidgetsFlutterBinding.ensureInitialized();

    await _initializeDesktopWindow();

    runApp(ProviderScope(
      child: app,
    ));
  }

  /// メインアプリケーションのウィンドウをイニシャライズする
  Future<void> _initializeDesktopWindow() async {
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
}
