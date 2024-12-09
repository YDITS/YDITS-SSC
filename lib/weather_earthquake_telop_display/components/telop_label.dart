//
// YDITS for SSC
//
// Copyright (C) よね/Yone
//
// https://github.com/YDITS/YDITS-SSC
//

import 'package:flutter/material.dart';

class TelopLabel extends StatelessWidget {
  final double width;
  final String text;
  final Color bgColor;
  final Color fontColor;
  final double fontSize;

  const TelopLabel({
    super.key,
    required this.width,
    required this.text,
    required this.bgColor,
    required this.fontColor,
    required this.fontSize
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: null,
      color: bgColor,
      child: Center(
        child: Text(
          text,
          style: TextStyle(fontSize: fontSize, color: fontColor),
        ),
      ),
    );
  }
}
