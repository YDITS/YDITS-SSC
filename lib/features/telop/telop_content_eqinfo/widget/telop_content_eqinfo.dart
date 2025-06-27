//
// YDITS for SSC
//
// Copyright (C) よね/Yone
//
// https://github.com/YDITS/YDITS-SSC
//

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ydits_ssc/features/telop/telop_content_eqinfo/notifier/telop_content_eqinfo_state_notifier.dart';
import 'package:ydits_ssc/features/telop/telop_content_eqinfo/model/telop_content_eqinfo_state_model.dart';

class TelopContentEqinfo extends ConsumerStatefulWidget {
  const TelopContentEqinfo({super.key});

  @override
  ConsumerState<TelopContentEqinfo> createState() => _TelopContentEqinfo();
}

class _TelopContentEqinfo extends ConsumerState<TelopContentEqinfo>
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
    TelopContentEqinfoStateModel state = ref.watch(telopContentEqinfoStateProvider());

    final textStyle = Theme.of(context).textTheme.bodyMedium!;
    final RenderBox renderBox = context.findRenderObject() as RenderBox;

    _windowWidth = renderBox.size.width;
    _textWidth = _calculateTextWidth(state.text, textStyle);

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
    TelopContentEqinfoStateModel state = ref.watch(telopContentEqinfoStateProvider());

    return SingleChildScrollView(
      controller: _scrollController,
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Text(
            state.text,
            style: TextStyle(fontSize: state.fontSize),
            softWrap: false,
            overflow: TextOverflow.visible,
          ),
        ],
      ),
    );
  }
}
