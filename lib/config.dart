//
// YDITS for SSC
//
// Copyright (C) よね/Yone
//
// https://github.com/YDITS/YDITS-SSC
//

import 'dart:ui';
import "package:ydits_ssc/core/version/version.dart";

final class YditsSscConfig {
  final String title = "YDITS for SSC";
  final String description = "Saitama Sora Cam 用に制作された防災情報アプリケーション。";
  final Version version =
      Version(major: 1, minor: 0, patch: 0, level: VersionLevels.develop);
}

final class YditsSscWindowConfig {
  YditsSscWindowConfig({required this.title});

  final String title;
  final Rect windowFrame = const Rect.fromLTWH(128, 128, 960, 540);
  final Size windowMinSize = const Size(640, 360);
  final Size windowMaxSize = Size.infinite;
}
