//
// YDITS for SSC
//
// Copyright (C) よね/Yone
//
// https://github.com/YDITS/YDITS-SSC
//

import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:desktop_multi_window/desktop_multi_window.dart';
import 'package:ydits_ssc/core/sub_windows/sub_windows_enum.dart';

final class WindowManager {
  WindowManager({
    required this.onFailedCloseWindow,
  }) {
    DesktopMultiWindow.setMethodHandler(
      (call, fromWindowId) async => await _windowMethodHandler(call, fromWindowId),
    );
  }

  final void Function(int) onFailedCloseWindow;
  final List<WindowController> _windowList = [];

  List<WindowController> get windowList => List.unmodifiable(_windowList);

  Future<WindowController> active(int windowId) async {
    for (final window in _windowList) {
      if (window.windowId == windowId) {
        return window;
      }
    }
    throw Exception('Window with id `$windowId` was not found');
  }

  Future<WindowController> createNewWindow({
    required String title,
    required SubWindows window,
    Rect frame = const Rect.fromLTWH(128, 128, 960, 540),
    bool create = false,
  }) async {
    final newWindow = await DesktopMultiWindow.createWindow(
      jsonEncode({"window": window.toString()}),
    );

    await newWindow.setFrame(frame);
    await newWindow.center();
    await newWindow.setTitle(title);

    if (create) {
      await newWindow.show();
    }

    _addWindowToList(newWindow);

    return newWindow;
  }

  Future<void> closeAllWindow() async {
    for (final window in List<WindowController>.from(_windowList)) {
      try {
        await window.close();
      } catch (error) {
        onFailedCloseWindow(window.windowId);
      }
    }
    _windowList.clear();
  }

  void _addWindowToList(WindowController newWindow) {
    _windowList.add(newWindow);
  }

  Future<void> _windowMethodHandler(MethodCall call, int fromWindowId) async {
      print("Method called from window: `$fromWindowId`");
  }
}
