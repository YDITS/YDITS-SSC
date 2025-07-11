//
// YDITS for SSC
//
// Copyright (C) よね/Yone
//
// https://github.com/YDITS/YDITS-SSC
//

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ydits_ssc/features/telop/telop_content/model/telop_content_state_model.dart';
import 'package:ydits_ssc/features/telop/telop_content/notifier/telop_content_state_notifier.dart';

/// A widget that displays scrolling telop content.
class TelopContent extends ConsumerStatefulWidget {
  const TelopContent({super.key});

  @override
  ConsumerState<TelopContent> createState() => _TelopContentState();
}

/// The private state class for the [TelopContent] widget.
class _TelopContentState extends ConsumerState<TelopContent>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    final int speed = ref.read(telopContentStateProvider).speed;

    _controller = AnimationController(
      duration: Duration(seconds: speed), // Sliding duration
      vsync: this,
    );

    _animation = Tween<double>(begin: 1.0, end: -1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.linear, // Linear movement
      ),
    );

    _controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
    final TelopContentStateModel state = ref.watch(telopContentStateProvider);

    return ClipRect(
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return AnimatedBuilder(
            animation: _controller,
            builder: (BuildContext context, Widget? child) {
              final double screenWidth = MediaQuery.of(context).size.width;

              return Transform.translate(
                offset: Offset(screenWidth * _animation.value, 0),
                child: Text(
                  state.text,
                  style: TextStyle(
                    fontSize: state.fontSize,
                    fontFamily: state.fontFamily,
                  ),
                  softWrap: false,
                  overflow: TextOverflow.visible,
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
