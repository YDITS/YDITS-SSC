//
// YDITS for SSC
//
// Copyright (C) よね/Yone
//
// https://github.com/YDITS/YDITS-SSC
//

import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ydits_ssc/features/telop/telop_label/model/telop_label_state_model.dart';

part 'telop_label_state_notifier.g.dart';

/// A notifier for managing the state of the telop label.
@riverpod
class TelopLabelState extends _$TelopLabelState {


  @override
  TelopLabelStateModel build() {
    return const TelopLabelStateModel();
  }

  /// Sets the text of the telop label.
  void setText(String text) {
    state = state.copyWith(newText: text);
  }
}
