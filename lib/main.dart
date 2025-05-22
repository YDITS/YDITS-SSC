//
// YDITS for SSC
//
// Copyright (C) よね/Yone
//
// https://github.com/YDITS/YDITS-SSC
//

import 'package:logging/logging.dart';
import 'package:ydits_ssc/config.dart';
import 'package:ydits_ssc/window_config.dart';
import 'package:ydits_ssc/src/app_runner.dart';

late final Logger logger;

Future<void> main(List<String> args) async {
  _initializeLogger();

  final appConfig = YditsSscAppConfig();
  final windowConfig = YditsSscWindowConfig();

  final appRunner = YditsSscAppRunner(
    args: args,
    mainAppConfig: appConfig,
    mainAppWindowConfig: windowConfig,
    logger: logger,
  );

  await appRunner.run();
}

/// Loggerをイニシャライズする
void _initializeLogger() {
  logger = Logger("logger");
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((record) {
    print('${record.level.name}: ${record.time}: ${record.message}');
  });
}
