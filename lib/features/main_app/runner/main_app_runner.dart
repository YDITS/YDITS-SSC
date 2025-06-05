//
// YDITS for SSC
//
// Copyright (C) よね/Yone
//
// https://github.com/YDITS/YDITS-SSC
//

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ydits_ssc/core/core.dart';
import 'package:ydits_ssc/features/features.dart';

/// YDITS for SSC メインアプリケーションの実行管理
final class YditsSscMainAppRunner extends MainAppRunner {
  YditsSscMainAppRunner({
    required super.windowConfig,
    super.logger,
  });

  /// アプリケーションを実行する
  @override
  Future<void> run() async {
    logger?.info("Starting Main application...");

    WidgetsFlutterBinding.ensureInitialized();

    final subWindows = await configureSubWindows();

    await initializeDesktopWindow();

    runApp(
      ProviderScope(
        child: YditsSscApp(
          config: YditsSscAppConfig(),
          subWindows: subWindows,
        ),
      ),
    );
  }

  /// WindowManagerインスタンス
  late final WindowManager subWindowManager;
}
