//
// YDITS for SSC
//
// Copyright (C) よね/Yone
//
// https://github.com/YDITS/YDITS-SSC
//

import 'dart:ui' as dart_ui;
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
  final dart_ui.Rect windowFrame =
      const dart_ui.Rect.fromLTWH(128, 128, 960, 540);
  final dart_ui.Size windowMinSize = const dart_ui.Size(640, 360);
  final dart_ui.Size windowMaxSize = dart_ui.Size.infinite;
}
