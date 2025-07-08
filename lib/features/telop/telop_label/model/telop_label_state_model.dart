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
    required this.width,
    required this.text,
    required this.bgColor,
    required this.fontColor,
    required this.fontSize,
    required this.fontFamily,
  });

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
