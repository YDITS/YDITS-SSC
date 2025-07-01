//
// YDITS for SSC
//
// Copyright (C) よね/Yone
//
// https://github.com/YDITS/YDITS-SSC
//

import 'package:flutter/material.dart';

@immutable
class TelopContentStateModel {
  const TelopContentStateModel({
    required this.text,
    required this.fontSize,
    required this.fontFamily,
    required this.speed,
  });

  final String text;
  final double fontSize;
  final String fontFamily;
  final int speed;

  TelopContentStateModel copyWith({
    required newText,
    required newFontSize,
    required newFontFamily,
    required newSpeed,
  }) {
    return TelopContentStateModel(
      text: newText,
      fontSize: newFontSize,
      fontFamily: newFontFamily,
      speed: newSpeed,
    );
  }
}
