//
// YDITS for SSC
//
// Copyright (C) よね/Yone
//
// https://github.com/YDITS/YDITS-SSC
//

import 'package:ydits_ssc/core/app_runner/app_runner.dart';
import 'package:ydits_ssc/features/app_runner/main_app_runner.dart';
import 'package:ydits_ssc/features/app_runner/sub_app_runner.dart';

/// The application runner for the YDITS for SSC application.
///
/// This class extends [AppRunner] and sets up the specific runners
/// for the main application and its sub-applications.
final class YditsSscAppRunner extends AppRunner {
  YditsSscAppRunner({required super.args, super.logger}) {
    mainAppRunner = YditsSscMainAppRunner(logger: logger);
    subAppRunner = YditsSscSubAppRunner(logger: logger);
  }
}
