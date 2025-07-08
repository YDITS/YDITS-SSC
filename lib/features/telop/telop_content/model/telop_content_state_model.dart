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
    required this.text,
    required this.fontSize,
    required this.fontFamily,
    required this.speed,
  });

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
