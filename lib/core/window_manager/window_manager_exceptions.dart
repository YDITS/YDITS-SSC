//
// YDITS for SSC
//
// Copyright (C) よね/Yone
//
// https://github.com/YDITS/YDITS-SSC
//

import 'package:ydits_ssc/core/exceptions/exceptions.dart';

/// An exception thrown when a window fails to close.
class WindowCloseException extends BaseException {
  WindowCloseException(super.key);

  /// The name of the exception.
  static String name = 'WindowCloseException';
}
