//
// YDITS for SSC
//
// Copyright (C) よね/Yone
//
// https://github.com/YDITS/YDITS-SSC
//

import 'package:logging/logging.dart';
import 'package:ydits_ssc/features/features.dart';

late final Logger logger;

Future<void> main(List<String> args) async {
  _initializeLogger();

  final mainAppWindowConfig = YditsSscWindowConfig();

  final mainAppRunner = YditsSscMainAppRunner(
    windowConfig: mainAppWindowConfig,
    logger: logger,
  );

  final subAppRunner = YditsSscSubAppRunner(logger: logger);

  final appRunner = YditsSscAppRunner(
    args: args,
    mainAppRunner: mainAppRunner,
    subAppRunner: subAppRunner,
    logger: logger,
  );

  await appRunner.runApp();
}

/// Loggerをイニシャライズする
void _initializeLogger() {
  logger = Logger("ydits_ssc");
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((record) {
    print('${record.level.name}: ${record.time}: ${record.message}');
  });
}
