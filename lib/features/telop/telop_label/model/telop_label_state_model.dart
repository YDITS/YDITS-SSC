//
// YDITS for SSC
//
// Copyright (C) よね/Yone
//
// https://github.com/YDITS/YDITS-SSC
//

import 'package:flutter/material.dart';

/// A data model representing the state of the telop label.
@immutable
class TelopLabelStateModel {
  const TelopLabelStateModel({
    this.width = defaultWidth,
    this.text = defaultInitialText,
    this.bgColor = defaultBgColor,
    this.fontColor = defaultFontColor,
    this.fontSize = defaultFontSize,
    this.fontFamily = defaultFontFamily,
  });

  /// The default width of the telop label.
  static const double defaultWidth = 144;

  /// The default initial text for the telop label.
  static const String defaultInitialText = 'Initializing...';

  /// The default background color of the telop label.
  static const Color defaultBgColor = Color.fromARGB(255, 31, 31, 31);

  /// The default font color of the telop label.
  static const Color defaultFontColor = Color.fromARGB(255, 223, 223, 223);

  /// The default font size.
  static const double defaultFontSize = 32;

  /// The default font family.
  static const String defaultFontFamily = 'M PLUS 2';

  /// The width of the label.
  final double width;

  /// The text displayed in the label.
  final String text;

  /// The background color of the label.
  final Color bgColor;

  /// The font color of the label.
  final Color fontColor;

  /// The font size of the label.
  final double fontSize;

  /// The font family of the label.
  final String fontFamily;

  /// Creates a copy of this model with the given fields replaced with new values.
  TelopLabelStateModel copyWith({
    double? newWidth,
    String? newText,
    Color? newBgColor,
    Color? newFontColor,
    double? newFontSize,
    String? newFontFamily,
  }) {
    return TelopLabelStateModel(
      width: newWidth ?? width,
      text: newText ?? text,
      bgColor: newBgColor ?? bgColor,
      fontColor: newFontColor ?? fontColor,
      fontSize: newFontSize ?? fontSize,
      fontFamily: newFontFamily ?? fontFamily,
    );
  }
}
