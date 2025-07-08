//
// YDITS for SSC
//
// Copyright (C) よね/Yone
//
// https://github.com/YDITS/YDITS-SSC
//

/// A base class for custom exceptions in the application.
class BaseException implements Exception {
  BaseException(this.message);

  /// A descriptive name for the exception.
  static String name = 'Exception';

  /// The message or object associated with the exception.
  Object? message;

  @override
  String toString() {
    if (message != null) {
      return '$name: ${Error.safeToString(message)}';
    }
    return name;
  }
}

/// An exception thrown for unhandled errors.
class UnhandledException extends BaseException {
  UnhandledException(super.key);

  /// The name of the exception.
  static String name = 'UnhandledException';
}

/// An exception thrown when logger initialization fails.
class LoggerInitializationFailed extends BaseException {
  LoggerInitializationFailed(super.key);

  /// The name of the exception.
  static String name = 'LoggerInitializationFailed';
}

/// An exception thrown when an application runner fails.
class AppRunnerException extends BaseException {
  AppRunnerException(super.key);

  /// The name of the exception.
  static String name = 'AppRunnerException';
}

/// An exception thrown when the main application runner fails.
class MainAppRunnerException extends AppRunnerException {
  @override
  MainAppRunnerException(super.key);

  /// The name of the exception.
  static String name = 'MainAppRunnerException';
}

/// An exception thrown when a sub-application runner fails.
class SubAppRunnerException extends AppRunnerException {
  @override
  SubAppRunnerException(super.key);

  /// The name of the exception.
  static String name = 'SubAppRunnerException';
}

/// An exception thrown when the main window fails to initialize.
class MainWindowInitializationFailed extends BaseException {
  @override
  MainWindowInitializationFailed(super.key);

  /// The name of the exception.
  static String name = 'MainWindowInitializationFailed';
}

/// An exception thrown when sub-windows fail to initialize.
class SubWindowsInitializationFailed extends BaseException {
  @override
  SubWindowsInitializationFailed(super.key);

  /// The name of the exception.
  static String name = 'SubWindowsInitializationFailed';
}
