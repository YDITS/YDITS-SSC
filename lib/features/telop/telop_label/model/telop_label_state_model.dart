//
// YDITS for SSC
//
// Copyright (C) よね/Yone
//
// https://github.com/YDITS/YDITS-SSC
//

import 'package:flutter/material.dart';

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

  final double width;
  final String text;
  final Color bgColor;
  final Color fontColor;
  final double fontSize;
  final String fontFamily;

  TelopLabelStateModel copyWith({
    required newWidth,
    required newText,
    required newBgColor,
    required newFontColor,
    required newFontSize,
    required newFontFamily,
  }) {
    return TelopLabelStateModel(
      width: newWidth,
      text: newText,
      bgColor: newBgColor,
      fontColor: newFontColor,
      fontSize: newFontSize,
      fontFamily: newFontFamily,
    );
  }
}
