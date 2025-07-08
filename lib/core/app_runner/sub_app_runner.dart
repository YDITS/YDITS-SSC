//
// YDITS for SSC
//
// Copyright (C) よね/Yone
//
// https://github.com/YDITS/YDITS-SSC
//

import 'package:logging/logging.dart';

/// An abstract class for managing the execution of sub-applications.
///
/// Subclasses must implement the [run] method to define how a sub-application
/// is launched based on the provided arguments.
abstract class SubAppRunner {
  SubAppRunner({this.logger});

  /// An optional logger instance for logging application events.
  final Logger? logger;

  /// Runs a sub-application based on the given [args].
  ///
  /// This method is responsible for interpreting the arguments and launching the
  /// corresponding sub-application.
  Future<void> run(List<String> args);
}
