//
// YDITS for SSC
//
// Copyright (C) よね/Yone
//
// https://github.com/YDITS/YDITS-SSC
//

import 'package:logging/logging.dart';
import 'package:ydits_ssc/features/app_runner/app_runner.dart';

const String loggerName = "ydits_ssc";
const Level loggerRootLevel = Level.ALL;
late final Logger logger;

Future<void> main(List<String> args) async {
  _initializeLogger();
  await YditsSscAppRunner(args: args, logger: logger).runApp();
}

/// Loggerをイニシャライズする
void _initializeLogger() {
  logger = Logger(loggerName);
  Logger.root.level = loggerRootLevel;
  Logger.root.onRecord.listen((record) {
    print('${record.level.name}: ${record.time}: ${record.message}');
  });
}
