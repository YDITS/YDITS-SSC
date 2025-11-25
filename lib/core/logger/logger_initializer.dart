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
    final File logFile = File('./data/_.log');
    if (!logFile.parent.existsSync()) {
      logFile.parent.createSync(recursive: true);
    }

    final IOSink sink = logFile.openWrite(mode: FileMode.append);
    final Logger logger = Logger('ydits_ssc');

    Logger.root.level = Level.ALL;
    Logger.root.onRecord.listen((LogRecord record) {
      final String message =
          '[${record.level.name.padRight(8)}] ${record.time}: ${record.message}';
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
