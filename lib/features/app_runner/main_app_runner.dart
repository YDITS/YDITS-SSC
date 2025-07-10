//
// YDITS for SSC
//
// Copyright (C) よね/Yone
//
// https://github.com/YDITS/YDITS-SSC
//

import 'package:configure/configure.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:ydits_ssc/apps/main_app/model/main_app_window_config.dart';
import 'package:ydits_ssc/apps/main_app/widget/main_app.dart';
import 'package:ydits_ssc/core/app_runner/main_app_runner.dart';

/// The main application runner for the YDITS for SSC application.
///
/// This class is responsible for setting up and running the main application window.
final class YditsSscMainAppRunner extends MainAppRunner {
  YditsSscMainAppRunner({super.logger});

  @override
  final WindowConfig windowConfig = YditsSscWindowConfig();

  /// Runs the main application.
  ///
  /// This method configures sub-windows, initializes the main desktop window,
  /// and then runs the application, passing the sub-window controllers to the
  /// main app widget.
  @override
  Future<void> run() async {
    logger?.info("Running main application...");

    final subWindows = await configureSubWindows();
    await initializeDesktopWindow();

    runApp(ProviderScope(child: YditsSscMainApp(subWindows: subWindows)));
  }
}
