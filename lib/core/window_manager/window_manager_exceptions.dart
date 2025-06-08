//
// YDITS for SSC
//
// Copyright (C) よね/Yone
//
// https://github.com/YDITS/YDITS-SSC
//

import 'package:ydits_ssc/core/exceptions/exceptions.dart';

/// Exception thrown when failed to close window
class WindowCloseFailed extends BaseException {
  WindowCloseFailed(super.key);
  static String name = "WindowCloseFailed";
}
