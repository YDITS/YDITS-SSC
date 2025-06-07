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
  final String fontFamily;

  const TelopLabel({
    super.key,
    required this.width,
    required this.text,
    required this.bgColor,
    required this.fontColor,
    required this.fontSize,
    required this.fontFamily,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(8)),
      width: width,
      height: null,
      color: bgColor,
      child: Center(
        child: Text(
          text,
          style: TextStyle(
              fontSize: fontSize, color: fontColor, fontFamily: fontFamily),
        ),
      ),
    );
  }
}
