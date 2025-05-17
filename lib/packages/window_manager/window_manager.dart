//
// Window Manager
//
// Copyright (C) よね/Yone
//
// https://github.com/YDITS/YDITS-SSC
//

import 'dart:convert';
import 'dart:ui';
import 'package:desktop_multi_window/desktop_multi_window.dart';

class WindowManager {
  WindowManager({
    required this.desktopMultiWindow,
  });

  final DesktopMultiWindow desktopMultiWindow;
  final List<WindowController> _windowList = [];

  List<WindowController> get windowList {
    return _windowList;
  }

  Future<WindowController> createNewWindow({
    required String title,
    Rect frame = const Rect.fromLTWH(128, 128, 960, 540),
    bool create = true,
  }) async {
    final newWindow = await DesktopMultiWindow.createWindow(jsonEncode({ }));

    newWindow
      ..setFrame(frame)
      ..center()
      ..setTitle(title);

    if (create) newWindow.show();

    _addWindowToList(newWindow);

    return newWindow;
  }

  Future<void> closeAllWindow(windowId) async {
    for (final window in windowList) {
      await window.close();
    }
  }

  void _addWindowToList(newWindow) {
    _windowList.add(newWindow);
  }
}
