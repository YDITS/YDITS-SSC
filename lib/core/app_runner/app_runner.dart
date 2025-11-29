//
// YDITS for SSC
//
// Copyright (C) よね/Yone
//
// https://github.com/YDITS/YDITS-SSC
//

import 'dart:io';

import 'package:desktop_multi_window/desktop_multi_window.dart';
import 'package:flutter_single_instance/flutter_single_instance.dart';
import 'package:logging/logging.dart';
import 'package:ydits_ssc/core/app_runner/main_app_runner.dart';
import 'package:ydits_ssc/core/app_runner/sub_app_runner.dart';
import 'package:ydits_ssc/core/exceptions/exceptions.dart';

/// Handles the application execution process.
abstract class AppRunner {
  AppRunner({required this.windowController, this.logger});

  /// Desktop Multi Window Caller Arguments.
  final WindowController windowController;

  /// The runner class for sub-applications.
  late final SubAppRunner subAppRunner;

  /// The runner class for the main application.
  late final MainAppRunner mainAppRunner;

  /// The logger instance.
  final Logger? logger;

  /// Runs the application.
  /// ---
  /// Routes which application to run based on the `desktop_multi_window`
  /// caller arguments [args] list.
  Future<void> runApp() async {
    logger?.info(
      "Running new application... | Args: ${windowController.arguments}",
    );

    if (windowController.arguments != "") {
      try {
        await subAppRunner.run();
      } catch (error) {
        throw SubAppRunnerException(error);
      }
      return;
    }

    await _checkAndHandleFirstInstance();

    try {
      await mainAppRunner.run();
    } catch (error) {
      throw MainAppRunnerException(error);
    }
  }

  /// Checks if this is the first instance of the application and handles it.
  ///
  /// If it is the first instance, this method completes normally.
  /// If an instance is already running, it focuses the existing instance and
  /// then exits the current process with `exit(0)`.
  Future<void> _checkAndHandleFirstInstance() async {
    final bool isFirstInstance =
        await FlutterSingleInstance().isFirstInstance();

    if (!isFirstInstance) {
      logger?.info("Application instance is already running.");
      await FlutterSingleInstance().focus();
      exit(0);
    }
  }
}
