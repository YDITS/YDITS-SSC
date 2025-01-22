//
// YDITS for SSC
//
// Copyright (C) よね/Yone
//
// https://github.com/YDITS/YDITS-SSC
//

import 'package:flutter/material.dart';

class TelopContentWeather extends StatefulWidget {
  final String text;
  final double fontSize;
  final String fontFamily;
  final double speed;
  final double labelWidth;

  const TelopContentWeather({
    super.key,
    required this.text,
    required this.fontSize,
    required this.fontFamily,
    required this.speed,
    required this.labelWidth,
  });

  @override
  State<TelopContentWeather> createState() => _TelopContentWeather();
}

class _TelopContentWeather extends State<TelopContentWeather>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double>? _animation;
  double _textWidth = 0;
  double _widgetWidth = 0;

  @override
  void initState() {
    super.initState();

    // Initialize animation controler
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
          _widgetWidth = constraints.maxWidth;

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
                      fontFamily: widget.fontFamily,
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
