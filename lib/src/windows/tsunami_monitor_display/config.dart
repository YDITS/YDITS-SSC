//
// YDITS for SSC
//
// Copyright (C) よね/Yone
//
// https://github.com/YDITS/YDITS-SSC
//

import 'dart:ui';
import 'package:version/version.dart';
import "package:configure/configure.dart";

/// Tsunami Monitor Display アプリケーションの設定
final class TsunamiMonitorDisplayAppConfig implements AppConfig {
  /// アプリケーションのタイトル
  @override
  final String title = "YDITS for SSC - Tsunami Monitor Display";

  /// アプリケーションの説明
  @override
  final String description = "Saitama Sora Cam 用に制作された防災情報アプリケーション。";

  /// アプリケーションのバージョン
  @override
  final Version version =
      Version(major: 1, minor: 0, patch: 0, level: VersionLevels.develop);
}

/// Tsunami Monitor Display ウィンドウの設定
final class TsunamiMonitorDisplayWindowConfig implements WindowConfig {
  /// ウィンドウのタイトル
  @override
  final String title = "YDITS for SSC - Tsunami Monitor Display";

  /// ウィンドウのフレームデータ
  @override
  final Rect windowFrame = const Rect.fromLTWH(128, 128, 960, 540);

  /// ウィンドウの初期サイズ
  @override
  final Size windowMinSize = const Size(640, 360);

  /// ウィンドウの最大サイズの制限値
  @override
  final Size windowMaxSize = Size.infinite;
}
