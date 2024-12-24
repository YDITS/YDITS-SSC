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
  double _textWidth = 0;
  double _windowWidth = 0;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _calculateTextWidth();
    });
  }

  void _calculateTextWidth() {
    final textPainter = TextPainter(
      text: TextSpan(
        text: widget.text,
        style: TextStyle(
          fontSize: widget.fontSize,
          fontFamily: widget.fontFamily,
        ),
      ),
      maxLines: 1,
      textDirection: TextDirection.ltr,
    )..layout();
    setState(() {
      _textWidth = textPainter.width;
      _windowWidth = MediaQuery.of(context).size.width;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: _scrollController,
      scrollDirection: Axis.horizontal,
      child: SizedBox(
        width: _textWidth,
        child: Text(
          widget.text,
          style: TextStyle(
            fontSize: widget.fontSize,
            fontFamily: widget.fontFamily,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
