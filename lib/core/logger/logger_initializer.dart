//
// YDITS for SSC
//
// Copyright (C) よね/Yone
//
// https://github.com/YDITS/YDITS-SSC
//

import 'dart:io';

import 'package:logging/logging.dart';
import 'package:ydits_ssc/core/exceptions/exceptions.dart';

/// Loggerをイニシャライズする
Logger? initializeLogger() {
  try {
    final logFile = File('./data/log.txt');
    final sink = logFile.openWrite(mode: FileMode.append);
    final Logger logger = Logger("ydits_ssc");

    Logger.root.level = Level.ALL;
    Logger.root.onRecord.listen((record) {
      final message =
          '[${record.level.name.padRight(5)}] ${record.time}: ${record.message}';
      print(message);
      sink.writeln(message);
    });

    return logger;
  } catch (error) {
    print(LoggerInitializationFailed(error).toString());
    return null;
  }
}
