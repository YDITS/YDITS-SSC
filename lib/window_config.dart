//
// YDITS for SSC
//
// Copyright (C) よね/Yone
//
// https://github.com/YDITS/YDITS-SSC
//

import 'dart:ui';
import "package:configure/configure.dart";

/// YDITS for SSC メインウィンドウの構成設定
final class YditsSscWindowConfig implements WindowConfig {
  /// ウィンドウのタイトル
  @override
  final String title = "YDITS for SSC";

  /// ウィンドウのフレームデータ
  @override
  final Rect frame = const Rect.fromLTWH(128, 128, 960, 540);

  /// ウィンドウの初期サイズ
  @override
  final Size minSize = const Size(640, 360);

  /// ウィンドウの最大サイズの制限値
  @override
  final Size maxSize = Size.infinite;
}
