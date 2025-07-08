//
// YDITS for SSC
//
// Copyright (C) よね/Yone
//
// https://github.com/YDITS/YDITS-SSC
//

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ydits_ssc/features/telop/telop_content/model/telop_content_state_model.dart';

part 'telop_content_state_notifier.g.dart';

/// A notifier for managing the state of the telop content.
@riverpod
class TelopContentState extends _$TelopContentState {
  @override
  TelopContentStateModel build() {
    return const TelopContentStateModel();
  }

  /// Sets the text of the telop content.
  void setText(String text) {
    state = state.copyWith(newText: text);
  }
}
