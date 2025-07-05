//
// YDITS for SSC
//
// Copyright (C) よね/Yone
//
// https://github.com/YDITS/YDITS-SSC
//

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';
import 'package:ydits_ssc/core/app_runner/main_app_runner.dart';
import 'package:ydits_ssc/core/app_runner/sub_app_runner.dart';
import 'package:ydits_ssc/core/exceptions/exceptions.dart';
import 'package:ydits_ssc/core/providers/logger/notifier/logger_notifier.dart';

/// アプリケーションの実行処理
abstract class AppRunner {
  AppRunner({required this.args, required this.container}) {
    logger = container.read(loggerNotifierProvider);
  }

  /// Desktop Multi Window Caller Arguments
  final List<String> args;

  /// ProviderContainer インスタンス
  final ProviderContainer container;

  /// サブアプリケーションの実行処理クラス
  late final SubAppRunner subAppRunner;

  /// メインアプリケーションの実行処理クラス
  late final MainAppRunner mainAppRunner;

  /// Loggerインスタンス
  late final Logger? logger;

  /// アプリケーションを実行する
  /// ---
  /// desktop_multi_window caller arguments [args] リストを参照して、実行するアプリケーションをルーティングします。
  Future<void> runApp() async {
    logger?.info("Running new application... | Args: ${args.toString()}");

    if (args.firstOrNull == "multi_window") {
      try {
        await subAppRunner.run(args);
      } catch (error) {
        throw SubAppRunnerException(error);
      }
      return;
    }

    try {
      await mainAppRunner.run();
    } catch (error) {
      throw MainAppRunnerException(error);
    }
  }
}
