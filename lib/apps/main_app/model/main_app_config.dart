//
// YDITS for SSC
//
// Copyright (C) よね/Yone
//
// https://github.com/YDITS/YDITS-SSC
//

import 'package:configure/configure.dart';
import 'package:version/version.dart';

/// Configuration for the YDITS for SSC main application.
final class YditsSscAppConfig implements AppConfig {
  /// The title of the application.
  @override
  final String title = 'YDITS for SSC';

  /// A description of the application.
  @override
  final String description = 'Saitama Sora Cam 用に制作された防災情報アプリケーション。';

  /// The version of the application.
  @override
  final Version version = Version(
    major: 1,
    minor: 0,
    patch: 0,
    level: VersionLevels.develop,
  );
}
