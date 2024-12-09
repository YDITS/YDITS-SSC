//
// YDITS for SSC
//
// Copyright (C) よね/Yone
//
// https://github.com/YDITS/YDITS-SSC
//

import 'package:flutter/material.dart';
import 'package:ydits_ssc/weather_earthquake_telop_display/components/measure_size.dart';

class TelopContent extends StatefulWidget {
  final String text;
  final double fontSize;
  final double speed;

  const TelopContent({
    super.key,
    required this.text,
    required this.fontSize,
    required this.speed,
  });

  @override
  State<TelopContent> createState() => _TelopContent();
}

class _TelopContent extends State<TelopContent>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double>? _animation;
  double widgetWidth = 0;
  double textWidth = 0;

  @override
  void initState() {
    super.initState();

    // アニメーションコントローラの初期化
    _controller = AnimationController(
      duration: const Duration(seconds: 15), // スライド時間
      vsync: this,
    );

    // アニメーションの範囲を設定
    _animation = Tween<double>(begin: 1.0, end: -2.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.linear, // 直線的に移動
      ),
    );

    // アニメーションを繰り返し設定
    _controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: LayoutBuilder(
        builder: (context, constraints) {
          widgetWidth = constraints.maxWidth;

          return AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              double screenWidth = MediaQuery.of(context).size.width;

              return SizedBox(
                width: screenWidth,
                child: Transform.translate(
                  offset: Offset(screenWidth * _animation!.value, 0),
                  child: Text(
                    widget.text,
                    style: TextStyle(
                      fontSize: widget.fontSize,
                    ),
                    softWrap: false,
                    overflow: TextOverflow.visible,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
