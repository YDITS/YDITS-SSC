//
// YDITS for SSC
//
// Copyright (C) よね/Yone
//
// https://github.com/YDITS/YDITS-SSC
//

import 'dart:convert';
import 'package:desktop_multi_window/desktop_multi_window.dart';
import 'package:flutter/services.dart';
import 'package:ydits_ssc/core/core.dart';

final class WindowManager {
  WindowManager({
    required this.onFailedCloseWindow,
  }) {
    DesktopMultiWindow.setMethodHandler(
        (call, fromWindowId) async =>
            await _windowMethodHandler(call, fromWindowId));
  }

  final void Function(int) onFailedCloseWindow;
  final List<WindowController> _windowList = [];

  List<WindowController> get windowList {
    return _windowList;
  }

  Future<WindowController> active(int windowId) async {
    for (final window in windowList) {
      if (window.windowId == windowId) {
        return window;
      }
    }
    throw Exception('Window with id `$windowId` was not found');
  }

  Future<WindowController> createNewWindow({
    required String title,
    required SubWindows window,
    Rect frame =
        const Rect.fromLTWH(128, 128, 960, 540),
    bool create = false,
  }) async {
    final newWindow =
        await DesktopMultiWindow.createWindow(jsonEncode({"window": window.toString()}));

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

  Future<void> _windowMethodHandler(MethodCall call, int fromWindowId) async {
      print("Method called from window: `$fromWindowId`");
  }
}
