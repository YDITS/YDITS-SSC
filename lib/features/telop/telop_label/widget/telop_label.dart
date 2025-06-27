//
// YDITS for SSC
//
// Copyright (C) よね/Yone
//
// https://github.com/YDITS/YDITS-SSC
//

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ydits_ssc/features/telop/telop_label/notifier/telop_label_state_notifier.dart';

class TelopLabel extends ConsumerWidget {
  const TelopLabel({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(telopLabelStateProvider());

    return Container(
      // decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(8)),
      width: state.width,
      height: null,
      color: state.bgColor,
      child: Center(
        child: Text(
          state.text,
          style: TextStyle(
            fontSize: state.fontSize,
            color: state.fontColor,
            fontFamily: state.fontFamily,
          ),
        ),
      ),
    );
  }
}
