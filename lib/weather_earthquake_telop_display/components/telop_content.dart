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

    _controller = AnimationController(vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: LayoutBuilder(builder: (context, constraints) {
        widgetWidth = constraints.maxWidth;

        return Row(
          children: [
            MeasureSize(
              onChange: (size) {
                if (size.width == textWidth) return;
                
                setState(() {
                  textWidth = size.width;
                  final distance = widgetWidth + textWidth;
                  final duration = distance / widget.speed;

                  _controller.duration = Duration(seconds: duration.toInt());
                  _animation =
                      Tween<double>(begin: widgetWidth, end: -textWidth)
                          .animate(
                    CurvedAnimation(parent: _controller, curve: Curves.linear),
                  );
                  _controller.repeat();
                });
              },
              child: _animation == null
                ? Container()
                : AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  double screenWidth = MediaQuery.of(context).size.width;

                  return SizedBox(
                    width: screenWidth,
                    child: Transform.translate(
                      offset: Offset(
                          screenWidth * _animation!.value, 0),
                      child: Text(
                        widget.text,
                        style: TextStyle(
                          fontSize: widget.fontSize,
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        );
      }),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
