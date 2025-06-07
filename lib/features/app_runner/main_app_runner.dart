//
// YDITS for SSC
//
// Copyright (C) よね/Yone
//
// https://github.com/YDITS/YDITS-SSC
//

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import "package:configure/configure.dart";

import 'package:ydits_ssc/core/app_runner/main_app_runner.dart';
import 'package:ydits_ssc/core/window_manager/window_manager.dart';
import 'package:ydits_ssc/features/main_app/main_app.dart';
import 'package:ydits_ssc/features/main_app/configure/main_app_config.dart';
import 'package:ydits_ssc/features/main_app/configure/main_app_window_config.dart';

/// YDITS for SSC メインアプリケーションの実行管理
final class YditsSscMainAppRunner extends MainAppRunner {
  YditsSscMainAppRunner({super.logger});

  @override
  final WindowConfig windowConfig = YditsSscWindowConfig();

  /// アプリケーションを実行する
  @override
  Future<void> run() async {
    logger?.info("Starting Main application...");

    WidgetsFlutterBinding.ensureInitialized();

    final subWindows = await configureSubWindows();

    await initializeDesktopWindow();

    runApp(
      ProviderScope(
        child: YditsSscApp(config: YditsSscAppConfig(), subWindows: subWindows),
      ),
    );
  }

  /// WindowManagerインスタンス
  late final WindowManager subWindowManager;
}
