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
  late ScrollController _scrollController;
  final double _textWidth = 0;
  final double _windowWidth = 0;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _startScrolling(double textWidth, double widgetWidth) {
    final double scrollDistance = textWidth + widgetWidth;
    final int scrollDuration = (scrollDistance / 50).round(); // 速度調整

    // 無限スクロール
    Future.delayed(const Duration(milliseconds: 500), () async {
      while (mounted) {
        await _scrollController.animateTo(
          scrollDistance,
          duration: Duration(seconds: scrollDuration),
          curve: Curves.linear,
        );
        _scrollController.jumpTo(0); // リセット
      }
    });
  }

  double _calculateTextWidth(String text, TextStyle style) {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(text: text, style: style),
      maxLines: 1,
      textDirection: TextDirection.ltr,
    )..layout();
    return textPainter.size.width;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final double windowWidth = constraints.maxWidth;

      // テキスト幅を計算
      final textStyle = Theme.of(context).textTheme.bodyMedium!;
      final double textWidth = _calculateTextWidth(widget.text, textStyle);

      // スクロール開始
      if (!_scrollController.hasClients) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          _startScrolling(textWidth, windowWidth);
        });
      }
      return SingleChildScrollView(
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            Text(
              widget.text,
              style: TextStyle(
                fontSize: widget.fontSize,
                fontFamily: widget.fontFamily,
              ),
              softWrap: false,
              overflow: TextOverflow.visible,
            ),
          ],
        ),
      );
    });
  }
}
