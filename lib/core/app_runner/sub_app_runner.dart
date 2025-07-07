//
// YDITS for SSC
//
// Copyright (C) よね/Yone
//
// https://github.com/YDITS/YDITS-SSC
//

import 'package:logging/logging.dart';

/// サブアプリケーションの実行管理
abstract class SubAppRunner {
  SubAppRunner({this.logger});

  /// Logger インスタンス
  final Logger? logger;

  /// サブアプリケーションを実行する
  Future<void> run(List<String> args);
}
