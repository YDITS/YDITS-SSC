//
// Configure
//
// Copyright (C) よね/Yone
//
// Licensed under the MIT License.
//
// https://github.com/YDITS/YDITS-SSC/blob/master/packages/configure
//

import 'package:version/version.dart';

/// Application's configuration settings
class AppConfig {
  const AppConfig({
    required this.title,
    required this.description,
    required this.version,
  });

  /// Application's title
  final String title;

  /// Application's description
  final String description;

  /// Application's version
  final Version version;
}
