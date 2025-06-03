//
// YDITS for SSC
//
// Copyright (C) よね/Yone
//
// https://github.com/YDITS/YDITS-SSC
//

import 'dart:convert' as dart_convert;
import 'package:desktop_multi_window/desktop_multi_window.dart'
    as desktop_multi_window;
import 'package:flutter/services.dart' as flutter_services;
import 'package:ydits_ssc/core/sub_windows/sub_windows_enum.dart';

final class WindowManager {
  WindowManager({
    required this.onFailedCloseWindow,
  }) {
    desktop_multi_window.DesktopMultiWindow.setMethodHandler(
        (call, fromWindowId) async =>
            await _windowMethodHandler(call, fromWindowId));
  }

  final void Function(int) onFailedCloseWindow;
  final List<desktop_multi_window.WindowController> _windowList = [];

  List<desktop_multi_window.WindowController> get windowList {
    return _windowList;
  }

  Future<desktop_multi_window.WindowController> active(int windowId) async {
    for (final window in windowList) {
      if (window.windowId == windowId) {
        return window;
      }
    }
    throw Exception('Window with id `$windowId` was not found');
  }

  Future<desktop_multi_window.WindowController> createNewWindow({
    required String title,
    required SubWindows window,
    flutter_services.Rect frame =
        const flutter_services.Rect.fromLTWH(128, 128, 960, 540),
    bool create = false,
  }) async {
    final newWindow =
        await desktop_multi_window.DesktopMultiWindow.createWindow(
            dart_convert.jsonEncode({"window": window.toString()}));

    newWindow
      ..setFrame(frame)
      ..center()
      ..setTitle(title);

    if (create) {
      newWindow.show();
    }

    _addWindowToList(newWindow);

    return newWindow;
  }

  Future<void> closeAllWindow() async {
    for (final window in windowList) {
      try {
        await window.close();
      } catch (error) {
        onFailedCloseWindow(window.windowId);
      }
    }
  }

  void _addWindowToList(newWindow) {
    _windowList.add(newWindow);
  }

  Future<void> _windowMethodHandler(
      flutter_services.MethodCall call, int fromWindowId) async {
    print("Method called from window: `$fromWindowId`");
  }
}
