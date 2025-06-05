//
// YDITS for SSC
//
// Copyright (C) よね/Yone
//
// https://github.com/YDITS/YDITS-SSC
//

import 'package:logging/logging.dart';
import "package:ydits_ssc/core/core.dart";

/// アプリケーションの実行処理
abstract class AppRunner {
  AppRunner({
    required this.args,
    required this.mainAppRunner,
    required this.subAppRunner,
    this.logger,
  });

  /// Desktop Multi Window Caller Arguments
  final List<String> args;

  /// メインアプリケーションの実行処理クラス
  final MainAppRunner mainAppRunner;

  /// サブアプリケーションの実行処理クラス
  final SubAppRunner subAppRunner;

  /// Loggerインスタンス
  final Logger? logger;


  /// アプリケーションを実行する
  /// ---
  /// desktop_multi_window caller arguments [args] リストを参照して、実行するアプリケーションをルーティングします。
  Future<void> runApp() async {
    logger?.info("Running new application... | Args: ${args.toString()}");

    if (args.firstOrNull == "multi_window") {
      await _runSubApp(args);
      return;
    }

    await _runMainApp();
  }

  /// メインアプリケーションを実行する
  Future<void> _runMainApp() async {
    await mainAppRunner.run();
  }

  /// サブアプリケーションを実行する
  Future<void> _runSubApp(List<String> args) async {
    await subAppRunner.run(args);
  }
}
