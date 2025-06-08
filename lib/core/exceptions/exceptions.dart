//
// YDITS for SSC
//
// Copyright (C) よね/Yone
//
// https://github.com/YDITS/YDITS-SSC
//

/// Base class of Exception
class BaseException implements Exception {
  BaseException(this.message);

  static String name = "Error";
  Object? message;

  @override
  String toString() {
    if (message != null) {
      return "$name: ${Error.safeToString(message)}";
    }

    return name;
  }
}

/// Unhandled Exception thrown
class UnhandledException extends BaseException {
  UnhandledException(super.key);
  static String name = "UnhandledException";
}

/// Exception thrown when failed to initialize Logger
class LoggerInitializationFailed extends BaseException {
  LoggerInitializationFailed(super.key);
  static String name = "LoggerInitializationError";
}

/// Exception thrown when failed to run applications
class AppRunnerException extends BaseException {
  AppRunnerException(super.key);
  static String name = "AppRunnerError";
}

/// Exception thrown when failed to run main application
class MainAppRunnerException extends AppRunnerException {
  @override
  MainAppRunnerException(super.key);
  static String name = "MainAppRunnerError";
}

/// Exception thrown when failed to run sub applications
class SubAppRunnerException extends AppRunnerException {
  @override
  SubAppRunnerException(super.key);
  static String name = "SubAppRunnerError";
}

/// Exception thrown when faild to initialize main window
class MainWindowInitializationFailed extends BaseException {
  @override
  MainWindowInitializationFailed(super.key);
  static String name = "MainWindowInitializationFailed";
}

/// Exception thrown when faild to initialize sub windows
class SubWindowsInitializationFailed extends BaseException {
  @override
  SubWindowsInitializationFailed(super.key);
  static String name = "SubWindowsInitializationFailed";
}
