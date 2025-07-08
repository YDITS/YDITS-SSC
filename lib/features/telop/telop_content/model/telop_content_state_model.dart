//
// YDITS for SSC
//
// Copyright (C) よね/Yone
//
// https://github.com/YDITS/YDITS-SSC
//

import 'package:flutter/material.dart';

/// A data model representing the state of the telop content.
@immutable
class TelopContentStateModel {
  const TelopContentStateModel({
    this.text = defaultInitialText,
    this.fontSize = defaultFontSize,
    this.fontFamily = defaultFontFamily,
    this.speed = defaultSpeed,
  });

  /// The default initial text for the telop content.
  static const String defaultInitialText = 'Fetching information...';

  /// The default font size.
  static const double defaultFontSize = 32;

  /// The default font family.
  static const String defaultFontFamily = 'M PLUS 2';

  /// The default speed for the sliding animation of the telop.
  static const int defaultSpeed = 15;

  /// The text to be displayed.
  final String text;

  /// The font size of the text.
  final double fontSize;

  /// The font family of the text.
  final String fontFamily;

  /// The animation speed of the telop.
  final int speed;

  /// Creates a copy of this model with the given fields replaced with new values.
  TelopContentStateModel copyWith({
    String? newText,
    double? newFontSize,
    String? newFontFamily,
    int? newSpeed,
  }) {
    return TelopContentStateModel(
      text: newText ?? text,
      fontSize: newFontSize ?? fontSize,
      fontFamily: newFontFamily ?? fontFamily,
      speed: newSpeed ?? speed,
    );
  }
}
