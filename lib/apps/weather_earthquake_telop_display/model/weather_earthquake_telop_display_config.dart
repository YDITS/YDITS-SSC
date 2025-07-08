//
// YDITS for SSC
//
// Copyright (C) よね/Yone
//
// https://github.com/YDITS/YDITS-SSC
//

import 'dart:ui';

import 'package:configure/configure.dart';
import 'package:flutter/material.dart';
import 'package:version/version.dart';

/// Configuration settings for the Weather Earthquake Telop Display.
final class WeatherEarthquakeTelopDisplayConfig {
  /// The default font size for the telop text.
  final double fontSize = 32;

  /// The font family used for the telop text.
  final String fontFamily = 'M PLUS 2';

  /// The width of the telop label.
  final double labelWidth = 144;

  /// The background color of the telop label.
  final Color labelBgColor = const Color.fromARGB(255, 31, 31, 31);

  /// The font color of the telop label.
  final Color labelFontColor = const Color.fromARGB(255, 223, 223, 223);

  /// The speed of the telop's sliding animation.
  final double telopSpeed = 100;

  /// The initial text displayed in the telop label.
  final String initialLabelText = 'Initializing...';

  /// The initial text displayed in the telop content.
  final String initialContentText = 'Fetching information...';

  /// The API key for OpenWeatherMap.
  final String openWeatherMapApiKey = 'c1aa80da02ee7ace26f8a124c82b831d';
}

/// Application-specific configuration for the Weather Earthquake Telop Display.
final class WeatherEarthquakeTelopDisplayAppConfig implements AppConfig {
  /// The title of the application.
  @override
  final String title = 'YDITS for SSC - Weather Earthquake Telop Display';

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

/// Window configuration for the Weather Earthquake Telop Display.
final class WeatherEarthquakeTelopDisplayWindowConfig implements WindowConfig {
  /// The title of the window.
  @override
  final String title = 'YDITS for SSC - Weather Earthquake Telop Display';

  /// The frame data of the window.
  @override
  final Rect frame = const Rect.fromLTWH(128, 128, 960, 128);

  /// The initial size of the window.
  @override
  final Size initialSize = const Size(960, 128);

  /// The minimum allowed size of the window.
  @override
  final Size minSize = const Size(640, 128);

  /// The maximum allowed size of the window.
  @override
  final Size maxSize = const Size(1920, 128);
}
