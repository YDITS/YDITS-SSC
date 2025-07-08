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
  /// The default width of the telop label.
  static const double defaultWidth = 144;

  /// The default initial text for the telop label.
  static const String defaultInitialText = 'Initializing...';

  /// The default background color of the telop label.
  static const Color defaultBgColor = Color.fromARGB(255, 31, 31, 31);

  /// The default font color of the telop label.
  static const Color defaultFontColor = Color.fromARGB(255, 223, 223, 223);

  /// The default font size.
  static const double defaultFontSize = 32;

  /// The default font family.
  static const String defaultFontFamily = 'M PLUS 2';

  @override
  TelopLabelStateModel build({
    double width = defaultWidth,
    String text = defaultInitialText,
    Color bgColor = defaultBgColor,
    Color fontColor = defaultFontColor,
    double fontSize = defaultFontSize,
    String fontFamily = defaultFontFamily,
  }) {
    return TelopLabelStateModel(
      width: width,
      text: text,
      bgColor: bgColor,
      fontColor: fontColor,
      fontSize: fontSize,
      fontFamily: fontFamily,
    );
  }

  /// Sets the text of the telop label.
  void setText(String text) {
    state = state.copyWith(newText: text);
  }
}
