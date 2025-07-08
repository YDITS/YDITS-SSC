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
  /// The default initial text for the telop content.
  static const String defaultInitialText = 'Fetching information...';

  /// The default font size.
  static const double defaultFontSize = 32;

  /// The default font family.
  static const String defaultFontFamily = 'M PLUS 2';

  /// The default speed for the sliding animation of the telop.
  static const int defaultSpeed = 15;

  @override
  TelopContentStateModel build({
    String text = defaultInitialText,
    double fontSize = defaultFontSize,
    String fontFamily = defaultFontFamily,
    int speed = defaultSpeed,
  }) {
    return TelopContentStateModel(
      text: text,
      fontSize: fontSize,
      fontFamily: fontFamily,
      speed: speed,
    );
  }

  /// Sets the text of the telop content.
  void setText(String text) {
    state = state.copyWith(newText: text);
  }
}
