//
// YDITS for SSC
//
// Copyright (C) よね/Yone
//
// https://github.com/YDITS/YDITS-SSC
//

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ydits_ssc/features/telop/telop_content/notifier/telop_content_state_notifier.dart';

class TelopContent extends ConsumerStatefulWidget {
  const TelopContent({
    super.key,
  });

  @override
  ConsumerState<TelopContent> createState() => _TelopContent();
}

class _TelopContent extends ConsumerState<TelopContent>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double>? _animation;

  @override
  void initState() {
    super.initState();

    // Initialize animation controler
    _controller = AnimationController(
      duration: const Duration(seconds: 15), // スライド時間
      vsync: this,
    );

    // アニメーションの範囲を設定
    _animation = Tween<double>(begin: 1.0, end: -1.0).animate(
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
    final state = ref.watch(telopContentStateProvider());

    return ClipRect(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              double screenWidth = MediaQuery.of(context).size.width;

              return SizedBox(
                width: screenWidth,
                child: Transform.translate(
                  offset: Offset(screenWidth * _animation!.value, 0),
                  child: Text(
                    state.text,
                    style: TextStyle(
                      fontSize: state.fontSize,
                      fontFamily: state.fontFamily,
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
