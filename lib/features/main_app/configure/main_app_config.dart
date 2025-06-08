//
// YDITS for SSC
//
// Copyright (C) よね/Yone
//
// https://github.com/YDITS/YDITS-SSC
//

import "package:version/version.dart";
import "package:configure/configure.dart";

/// YDITS for SSC メインアプリケーションの設定
final class YditsSscAppConfig implements AppConfig {
  /// アプリケーションのタイトル
  @override
  final String title = "YDITS for SSC";

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
