//
// YDITS for SSC
//
// Copyright (C) よね/Yone
//
// https://github.com/YDITS/YDITS-SSC
//

import 'package:flutter/material.dart';

class TelopContentEqinfo extends StatefulWidget {
  final String text;
  final double fontSize;
  final double speed;

  const TelopContentEqinfo({
    super.key,
    required this.text,
    required this.fontSize,
    required this.speed,
  });

  @override
  State<TelopContentEqinfo> createState() => _TelopContentEqinfo();
}

class _TelopContentEqinfo extends State<TelopContentEqinfo>
    with SingleTickerProviderStateMixin {
  late ScrollController _scrollController;
  double _textWidth = 0;
  double _windowWidth = 0;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    WidgetsBinding.instance.addPostFrameCallback((_) => _startScrolling());
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _startScrolling() {
    final textStyle = Theme.of(context).textTheme.bodyMedium!;
    final RenderBox renderBox = context.findRenderObject() as RenderBox;

    _windowWidth = renderBox.size.width;
    _textWidth = _calculateTextWidth(widget.text, textStyle);

    final scrollDistance = _textWidth + _windowWidth;
    final scrollDuration = (scrollDistance / 50).round(); // 速度を一定に保つ

    _scrollText(scrollDistance, scrollDuration);
  }

  void _scrollText(double distance, int duration) async {
    while (true) {
      await _scrollController.animateTo(
        distance,
        duration: Duration(seconds: duration),
        curve: Curves.linear,
      );
      _scrollController.jumpTo(0); // リセットして繰り返す
    }
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
    return SingleChildScrollView(
      controller: _scrollController,
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Text(
            widget.text,
            style: TextStyle(
              fontSize: widget.fontSize,
            ),
            softWrap: false,
            overflow: TextOverflow.visible,
          ),
        ],
      ),
    );
  }
}
