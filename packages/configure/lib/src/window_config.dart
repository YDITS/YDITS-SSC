//
// Configure
//
// Copyright (C) よね/Yone
//
// Licensed under the MIT License.
//
// https://github.com/YDITS/YDITS-SSC/blob/master/packages/configure
//

import 'dart:ui';

/// Window configuration settings.
class WindowConfig {
  const WindowConfig({required this.title});

  /// ウィンドウのタイトル
  final String title;

  /// ウィンドウのフレームデータ
  final Rect windowFrame = const Rect.fromLTWH(128, 128, 960, 540);

  /// ウィンドウの初期サイズ
  final Size windowMinSize = const Size(640, 360);

  /// ウィンドウの最大サイズの制限値
  final Size windowMaxSize = Size.infinite;
}
