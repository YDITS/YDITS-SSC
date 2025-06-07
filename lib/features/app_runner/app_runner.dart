//
// YDITS for SSC
//
// Copyright (C) よね/Yone
//
// https://github.com/YDITS/YDITS-SSC
//

import 'package:ydits_ssc/core/app_runner/app_runner.dart';

/// YDITS for SSC アプリケーションの実行処理
final class YditsSscAppRunner extends AppRunner {
  YditsSscAppRunner({
    required super.args,
    required super.mainAppRunner,
    required super.subAppRunner,
    super.logger,
  });
}
