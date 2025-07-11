//
// YDITS for SSC
//
// Copyright (C) よね/Yone
//
// https://github.com/YDITS/YDITS-SSC
//

import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';
import 'package:ydits_ssc/core/exceptions/exceptions.dart';

/// Initializes the logger for the application.
///
/// This function sets up a logger that writes to both the console and a log file.
/// It returns a [Logger] instance on success, or `null` on failure.
Logger? initializeLogger() {
  try {
    // Ensure the directory exists before creating the file.
    final logFile = File('./data/log.txt');
    if (!logFile.parent.existsSync()) {
      logFile.parent.createSync(recursive: true);
    }

    final sink = logFile.openWrite(mode: FileMode.append);
    final logger = Logger('ydits_ssc');

    Logger.root.level = Level.ALL;
    Logger.root.onRecord.listen((record) {
      final message =
          '[${record.level.name.padRight(5)}] ${record.time}: ${record.message}';
      if (kDebugMode) {
        debugPrint(message);
      }
      sink.writeln(message);
    });

    return logger;
  } catch (error) {
    if (kDebugMode) {
      debugPrint(LoggerInitializationFailed(error).toString());
    }
    return null;
  }
}
