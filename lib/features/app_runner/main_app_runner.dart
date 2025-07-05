//
// YDITS for SSC
//
// Copyright (C) よね/Yone
//
// https://github.com/YDITS/YDITS-SSC
//

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:ydits_ssc/core/app_runner/main_app_runner.dart';
import 'package:ydits_ssc/apps/main_app/widget/main_app.dart';

/// YDITS for SSC メインアプリケーションの実行管理
final class YditsSscMainAppRunner extends MainAppRunner {
  YditsSscMainAppRunner({required super.container});

  /// アプリケーションを実行する
  @override
  Future<void> run() async {
    logger?.info("Running main application...");

    final subWindows = await configureSubWindows();
    await initializeDesktopWindow();

    runApp(
      UncontrolledProviderScope(
        container: container,
        child: YditsSscMainApp(subWindows: subWindows),
      ),
    );
  }
}
