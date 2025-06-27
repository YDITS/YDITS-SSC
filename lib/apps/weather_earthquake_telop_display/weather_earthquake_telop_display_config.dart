//
// YDITS for SSC
//
// Copyright (C) よね/Yone
//
// https://github.com/YDITS/YDITS-SSC
//

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:version/version.dart';
import "package:configure/configure.dart";

final class WeatherEarthquakeTelopDisplayConfig {
  /// デフォルトのフォントサイズ
  final double fontSize = 32;

  /// フォント
  final String fontFamily = "M PLUS 2";

  /// テロップのラベルの幅
  final double labelWidth = 144;

  /// テロップのラベルの背景色
  final Color labelBgColor = const Color.fromARGB(255, 31, 31, 31);

  /// テロップのラベルの文字色
  final Color labelFontColor = const Color.fromARGB(255, 223, 223, 223);

  /// テロップのスライドアニメーション速度
  final double telopSpeed = 100;

  /// テロップのラベルの初期値
  final String initialLabelText = "起動中…";

  /// テロップのコンテントの初期値
  final String initialContentText = "情報を取得しています…";

  /// Open Weather Map の API Key
  final String openWeatherMapApiKey = "c1aa80da02ee7ace26f8a124c82b831d";
}

/// Weather Earthquake Telop Display アプリケーションの設定
final class WeatherEarthquakeTelopDisplayAppConfig implements AppConfig {
  /// アプリケーションのタイトル
  @override
  final String title = "YDITS for SSC - Weather Earthquake Telop Display";

  /// アプリケーションの説明
  @override
  final String description = "Saitama Sora Cam 用に制作された防災情報アプリケーション。";

  /// アプリケーションのバージョン
  @override
  final Version version = Version(
    major: 1,
    minor: 0,
    patch: 0,
    level: VersionLevels.develop,
  );
}

/// Tsunami Monitor Display ウィンドウの設定
final class WeatherEarthquakeTelopDisplayWindowConfig implements WindowConfig {
  /// ウィンドウのタイトル
  @override
  final String title = "YDITS for SSC - Weather Earthquake Telop Display";

  /// ウィンドウのフレームデータ
  @override
  final Rect frame = const Rect.fromLTWH(128, 128, 960, 128);

  /// ウィンドウの初期サイズ
  @override
  final Size initialSize = const Size(960, 128);

  /// ウィンドウの最小サイズの制限値
  @override
  final Size minSize = const Size(640, 128);

  /// ウィンドウの最大サイズの制限値
  @override
  final Size maxSize = const Size(1920, 128);
}
