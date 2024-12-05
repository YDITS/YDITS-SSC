//
// YDITS for SSC
//
// Copyright (C) よね/Yone
//
// https://github.com/YDITS/YDITS-SSC
//

import 'dart:ui';

abstract final class Config {
  static String windowTitle = 'YDITS for SSC - Tsunami Monitor Display';
  static Rect windowFrame = const Rect.fromLTWH(128, 128, 960, 128);
  static Size windowMinSize = const Size(640, 128);
  static Size windowMaxSize = const Size(1792, 128);
}