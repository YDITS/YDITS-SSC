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

@riverpod
class TelopContentState extends _$TelopContentState {
  /// デフォルトのテロップコンテントの初期値
  static const String defaultInitialText = "情報を取得しています…";

  /// デフォルトのフォントサイズ
  static const double defaultFontSize = 32;

  /// デフォルトのフォント
  static const String defaultFontFamily = "M PLUS 2";

  /// デフォルトのテロップのスライドアニメーション速度
  static const int defaultSpeed = 15;

  @override
  TelopContentStateModel build({
    text = TelopContentState.defaultInitialText,
    fontSize = TelopContentState.defaultFontSize,
    fontFamily = TelopContentState.defaultFontFamily,
    speed = TelopContentState.defaultSpeed,
  }) {
    return TelopContentStateModel(
      text: text,
      fontSize: fontSize,
      fontFamily: fontFamily,
      speed: speed,
    );
  }

  void setText(text) {
    state = state.copyWith(
      newText: text,
      newFontSize: state.fontSize,
      newFontFamily: state.fontFamily,
      newSpeed: state.speed,
    );
  }
}
