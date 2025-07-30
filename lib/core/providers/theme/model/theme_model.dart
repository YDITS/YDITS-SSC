//
// YDITS for SSC
//
// Copyright (C) よね/Yone
//
// https://github.com/YDITS/YDITS-SSC
//

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

/// A model of the theme settings in the application.
final class ThemeModel {
  ThemeModel({
    this.lightForeground = const Color.fromARGB(255, 32, 32, 32),
    this.lightBackground = const Color.fromARGB(255, 240, 240, 240),
    this.darkForeground = const Color.fromARGB(255, 240, 240, 240),
    this.darkBackground = const Color.fromARGB(255, 16, 16, 16),
    this.primaryForeground = const Color.fromARGB(255, 240, 240, 240),
    this.primaryBackground = const Color.fromARGB(255, 64, 64, 240),
    this.secoundryForeground = const Color.fromARGB(255, 240, 240, 240),
    this.secoundryBackground = const Color.fromARGB(255, 65, 240, 131),
    this.tertiaryForeground = const Color.fromARGB(255, 240, 240, 240),
    this.tertiaryBackground = const Color.fromARGB(255, 240, 73, 65),
  });

  /// The foreground color of light theme
  final Color lightForeground;

  /// The background color of light theme
  final Color lightBackground;

  /// The foreground color of dart theme
  final Color darkForeground;

  /// The background color of dart theme
  final Color darkBackground;

  /// The foreground color of primary theme
  final Color primaryForeground;

  /// The background color of primary theme
  final Color primaryBackground;

  /// The foreground color of secoundry theme
  final Color secoundryForeground;

  /// The background color of secoundry theme
  final Color secoundryBackground;

  /// The foreground color of tertiary theme
  final Color tertiaryForeground;

  /// The background color of tertiary theme
  final Color tertiaryBackground;
}
