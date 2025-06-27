//
// YDITS for SSC
//
// Copyright (C) よね/Yone
//
// https://github.com/YDITS/YDITS-SSC
//

import 'package:ydits_ssc/features/telop/telop_content_eqinfo/model/telop_content_eqinfo_state_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'telop_content_eqinfo_state_notifier.g.dart';

@riverpod
class TelopContentEqinfoState extends _$TelopContentEqinfoState {
  /// デフォルトのフォントサイズ
  static const double defaultFontSize = 32;

  /// デフォルトのテロップコンテントの初期値
  static const String defaultInitialText = "情報を取得しています…";

  /// デフォルトのテロップのスライドアニメーション速度
  static const double defaultSpeed = 100;

  @override
  TelopContentEqinfoStateModel build({
    text = TelopContentEqinfoState.defaultInitialText,
    fontSize = TelopContentEqinfoState.defaultFontSize,
    speed = TelopContentEqinfoState.defaultSpeed,
  }) {
    return TelopContentEqinfoStateModel(
      text: text,
      fontSize: fontSize,
      speed: speed,
    );
  }

  void setText(text) {
    state = state.copyWith(
      newText: text,
      newFontSize: state.fontSize,
      newSpeed: state.speed,
    );
  }
}
