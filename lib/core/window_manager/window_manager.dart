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
import 'package:ydits_ssc/core/sub_windows/sub_windows.dart';

/// A class to manage multiple windows in the YDITS for SSC application.
final class YditsSscWindowManager {
  YditsSscWindowManager({required this.onFailedCloseWindowCallback}) {
    DesktopMultiWindow.setMethodHandler(
      (call, fromWindowId) async =>
          await _windowMethodHandler(call, fromWindowId),
    );
  }

  /// A callback function that is invoked when a window fails to close.
  final void Function(int) onFailedCloseWindowCallback;
  final List<WindowController> _windowList = [];

  /// A read-only list of all managed window controllers.
  List<WindowController> get windowList => List.unmodifiable(_windowList);

  /// Retrieves the active [WindowController] for the given [windowId].
  ///
  /// Throws an exception if the window is not found.
  Future<WindowController> active(int windowId) async {
    for (final window in _windowList) {
      if (window.windowId == windowId) {
        return window;
      }
    }
    throw Exception('Window with id `$windowId` was not found');
  }

  /// Creates a new window.
  ///
  /// - [title]: The title of the new window.
  /// - [window]: The type of sub-window to create.
  /// - [frame]: The initial position and size of the window.
  /// - [showOnCreate]: Whether to show the window immediately after creation.
  Future<WindowController> createNewWindow({
    required String title,
    required SubWindows window,
    Rect frame = const Rect.fromLTWH(128, 128, 960, 540),
    bool showOnCreate = false,
  }) async {
    final newWindow = await DesktopMultiWindow.createWindow(
      jsonEncode({'window': window.toString()}),
    );

    await newWindow.setFrame(frame);
    await newWindow.center();
    await newWindow.setTitle(title);

    if (showOnCreate) {
      await newWindow.show();
    }

    _addWindowToList(newWindow);

    return newWindow;
  }

  /// Closes all managed windows.
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

  /// A wrapper for the callback to handle window close failures.
  void onFailedCloseWindow(int windowId) {
    onFailedCloseWindowCallback(windowId);
  }
}
