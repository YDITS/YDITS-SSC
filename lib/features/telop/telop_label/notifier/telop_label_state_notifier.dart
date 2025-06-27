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

@riverpod
class TelopLabelState extends _$TelopLabelState {
  /// デフォルトのテロップラベルの幅
  static const double defaultWidth = 144;

  /// デフォルトのテロップラベルの初期値
  static const String defaultInitialText = "起動中…";

  /// デフォルトのテロップラベルの背景色
  static const Color defaultBgColor = Color.fromARGB(255, 31, 31, 31);

  /// デフォルトのテロップラベルの文字色
  static const Color defaultFontColor = Color.fromARGB(255, 223, 223, 223);

  /// デフォルトのフォントサイズ
  static const double defaultFontSize = 32;

  /// デフォルトのフォント
  static const String defaultFontFamily = "M PLUS 2";

  @override
  TelopLabelStateModel build({
    width = TelopLabelState.defaultWidth,
    text = TelopLabelState.defaultInitialText,
    bgColor = TelopLabelState.defaultBgColor,
    fontColor = TelopLabelState.defaultFontColor,
    fontSize = TelopLabelState.defaultFontSize,
    fontFamily = TelopLabelState.defaultFontFamily,
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

  void setText(text) {
    state = state.copyWith(
      newWidth: state.width,
      newText: text,
      newBgColor: state.bgColor,
      newFontColor: state.fontColor,
      newFontSize: state.fontSize,
      newFontFamily: state.fontFamily,
    );
  }
}
