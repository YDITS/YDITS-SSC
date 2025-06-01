//
// YDITS for SSC
//
// Copyright (C) よね/Yone
//
// https://github.com/YDITS/YDITS-SSC
//

import 'package:logging/logging.dart';
import 'package:ydits_ssc/core/configure/app_config.dart';
import 'package:ydits_ssc/core/configure/window_config.dart';
import 'package:ydits_ssc/src/main_app_runner.dart';
import 'package:ydits_ssc/src/sub_app_runner.dart';

/// YDITS for SSC アプリケーションの実行処理
class YditsSscAppRunner {
  /// Desktop Multi Window Caller Arguments
  final List<String> args;

  /// メインアプリケーションの構成設定
  final AppConfig mainAppConfig;

  /// メインウィンドウの構成設定
  final WindowConfig mainAppWindowConfig;

  /// Loggerインスタンス
  final Logger? logger;

  YditsSscAppRunner({
    required this.args,
    required this.mainAppConfig,
    required this.mainAppWindowConfig,
    this.logger,
  });

  /// アプリケーションを実行する
  /// ---
  /// desktop_multi_window caller arguments [args] リストを参照して、実行するアプリケーションをルーティングします。
  Future<void> run() async {
    logger?.info("Running new application... | Args: ${args.toString()}");

    if (args.firstOrNull == "multi_window") {
      await _runSubApp(args);
      return;
    }

    await _runMainApp();
  }

  /// サブアプリケーションを実行する
  Future<void> _runMainApp() async {
    final runner = YditsSscMainAppRunner(
        config: mainAppConfig, windowConfig: mainAppWindowConfig);
    await runner.run();
  }

  /// サブアプリケーションを実行する
  Future<void> _runSubApp(List<String> args) async {
    final runner = YditsSscSubAppRunner(logger: logger);
    await runner.run(args);
  }
}
