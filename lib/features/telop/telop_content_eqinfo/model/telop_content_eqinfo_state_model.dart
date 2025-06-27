//
// YDITS for SSC
//
// Copyright (C) よね/Yone
//
// https://github.com/YDITS/YDITS-SSC
//

import 'package:flutter/material.dart';

@immutable
class TelopContentEqinfoStateModel {
  const TelopContentEqinfoStateModel({
    required this.text,
    required this.fontSize,
    required this.speed,
  });

  final String text;
  final double fontSize;
  final double speed;

  TelopContentEqinfoStateModel copyWith({
    required newText,
    required newFontSize,
    required newSpeed,
  }) {
    return TelopContentEqinfoStateModel(
      text: newText,
      fontSize: newFontSize,
      speed: newSpeed,
    );
  }
}
