//
// YDITS for SSC
//
// Copyright (C) よね/Yone
//
// https://github.com/YDITS/YDITS-SSC
//

import 'dart:ui';

import 'package:configure/configure.dart';
import 'package:version/version.dart';

/// Configuration for the EEW (Earthquake Early Warning) Monitor Display application.
final class EEWMonitorDisplayAppConfig implements AppConfig {
  /// The title of the application.
  @override
  final String title = 'YDITS for SSC - EEW Monitor Display';

  /// A description of the application.
  @override
  final String description =
      'A disaster prevention information application created for Saitama Sora Cam.';

  /// The version of the application.
  @override
  final Version version = Version(
    major: 1,
    minor: 0,
    patch: 0,
    level: VersionLevels.develop,
  );
}

/// Window configuration for the EEW (Earthquake Early Warning) Monitor Display.
final class EEWMonitorDisplayWindowConfig implements WindowConfig {
  /// The title of the window.
  @override
  final String title = 'EEW Monitor Display';

  /// The frame data of the window.
  @override
  final Rect frame = const Rect.fromLTWH(128, 128, 960, 540);

  /// The initial size of the window.
  @override
  final Size initialSize = const Size(960, 540);

  /// The minimum allowed size of the window.
  @override
  final Size minSize = const Size(640, 360);

  /// The maximum allowed size of the window.
  @override
  final Size maxSize = Size.infinite;
}
