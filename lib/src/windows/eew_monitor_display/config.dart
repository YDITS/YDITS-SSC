//
// YDITS for SSC
//
// Copyright (C) よね/Yone
//
// https://github.com/YDITS/YDITS-SSC
//

import 'dart:ui';

abstract final class Config {
  static String windowTitle = 'YDITS for SSC - EEW Monitor Display';
  static Rect windowFrame = const Rect.fromLTWH(128, 128, 960, 540);
  static Size windowMinSize = const Size(640, 360);
  static Size windowMaxSize = Size.infinite;
}
