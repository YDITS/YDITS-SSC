//
// YDITS for SSC
//
// Copyright (C) よね/Yone
//
// https://github.com/YDITS/YDITS-SSC
//

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';
import 'package:ydits_ssc/core/providers/logger/notifier/logger_notifier.dart';

/// サブアプリケーションの実行管理
abstract class SubAppRunner {
  SubAppRunner({required this.container}) {
    logger = container.read(loggerNotifierProvider);
  }

  /// ProviderContainer インスタンス
  final ProviderContainer container;

  /// Logger インスタンス
  late final Logger? logger;

  /// サブアプリケーションを実行する
  Future<void> run(List<String> args);
}
