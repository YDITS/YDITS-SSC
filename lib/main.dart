//
// YDITS for SSC
//
// Copyright (C) よね/Yone
//
// https://github.com/YDITS/YDITS-SSC
//

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:ydits_ssc/core/logger/logger_initializer.dart';
import 'package:ydits_ssc/features/app_runner/app_runner.dart';

Future<void> main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  final Logger? logger = initializeLogger();

  try {
    await YditsSscAppRunner(args: args, logger: logger).runApp();
  } catch (error) {
    print(error);
  }
}
