//
// YDITS for SSC
//
// Copyright (C) よね/Yone
//
// https://github.com/YDITS/YDITS-SSC
//

import 'package:logging/logging.dart';
import 'package:ydits_ssc/core/exceptions/exceptions.dart';
import 'package:ydits_ssc/features/app_runner/app_runner.dart';

Future<void> main(List<String> args) async {
  final Logger? logger = _initializeLogger();

  try {
    await YditsSscAppRunner(args: args, logger: logger).runApp();
  } catch (error) {
    print(error);
  }
}

/// Loggerをイニシャライズする
Logger? _initializeLogger() {
  try {
    final Logger logger = Logger("ydits_ssc");

    Logger.root.level = Level.ALL;
    Logger.root.onRecord.listen((record) {
      print('${record.level.name}: ${record.time}: ${record.message}');
    });
    return logger;
  } catch (error) {
    print(LoggerInitializationFailed(error).toString());
    return null;
  }
}
