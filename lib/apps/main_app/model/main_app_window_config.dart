//
// YDITS for SSC
//
// Copyright (C) よね/Yone
//
// https://github.com/YDITS/YDITS-SSC
//

import 'dart:ui';

import 'package:configure/configure.dart';

/// Window configuration for the YDITS for SSC main application.
final class YditsSscWindowConfig implements WindowConfig {
  /// The title of the window.
  @override
  final String title = 'YDITS for SSC';

  /// The frame data of the window.
  @override
  final Rect frame = const Rect.fromLTWH(128, 128, 960, 540);

  /// The initial size of the window.
  @override
  final Size initialSize = const Size(960, 540);

  /// The minimum allowed size of the window.
  @override
  final Size minSize = const Size(640, 360);

  /// The maximum allowed size of the window.
  @override
  final Size maxSize = Size.infinite;
}
