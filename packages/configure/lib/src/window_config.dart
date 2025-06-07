//
// Configure
//
// Copyright (C) よね/Yone
//
// Licensed under the MIT License.
//
// https://github.com/YDITS/YDITS-SSC/blob/master/packages/configure
//

import 'dart:ui';

/// Window configuration settings.
class WindowConfig {
  const WindowConfig({
    required this.title,
    this.frame = const Rect.fromLTWH(128, 128, 960, 540),
    this.initialSize = const Size(960, 540),
    this.minSize = const Size(640, 360),
    this.maxSize = Size.infinite,
  });

  /// Window's title
  final String title;

  /// Window's frame data
  final Rect frame;

  /// Window's initial size
  final Size initialSize;

  /// Window's minimum size
  final Size minSize;

  /// Window's maximum size
  final Size maxSize;
}
