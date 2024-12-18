//
// YDITS for SSC
//
// Copyright (C) よね/Yone
//
// https://github.com/YDITS/YDITS-SSC
//

import 'dart:ui';

abstract final class Config {
  static String windowTitle = 'YDITS for SSC - Weather Earthquake Telop Display';
  static Rect windowFrame = const Rect.fromLTWH(128, 128, 960, 128);
  static Size windowMinSize = const Size(640, 128);
  static Size windowMaxSize = const Size(1920, 128);
  static double fontSize = 24;
  static double labelWidth = 144;
  static double telopSpeed = 100;
  static String initialLabelText = "起動中…";
  static String initialContentText = "情報を取得しています…";
  static String openWeatherMapApiKey = "c1aa80da02ee7ace26f8a124c82b831d";
}