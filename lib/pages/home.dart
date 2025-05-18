//
// YDITS for SSC
//
// Copyright (C) よね/Yone
//
// https://github.com/YDITS/YDITS-SSC
//

import 'package:flutter/material.dart' as flutter;
import 'package:desktop_multi_window/desktop_multi_window.dart' as desktop_multi_window;
import 'package:ydits_ssc/core/sub_windows/sub_windows.dart';
import 'package:ydits_ssc/core/sub_windows/sub_windows_title.dart';

class HomePage extends flutter.StatefulWidget {
  const HomePage({
    super.key,
    required this.title,
    required this.windows,
  });

  final String title;
  final Map<SubWindows, desktop_multi_window.WindowController> windows;

  @override
  flutter.State<HomePage> createState() => HomePageState();
}

class HomePageState extends flutter.State<HomePage> {
  @override
  flutter.Widget build(flutter.BuildContext context) {
    return flutter.Scaffold(
      appBar: flutter.AppBar(
        title: flutter.Text(widget.title),
      ),
      body: flutter.Column(
        children: [
          flutter.Text(widget.title, style: const flutter.TextStyle(fontSize: 24)),
          const flutter.SizedBox(
            height: 24,
          ),
          flutter.Expanded(
            child: flutter.ListView.separated(
              itemCount: 3,
              itemBuilder: (context, index) {
                return flutter.TextButton(
                  onPressed: () => _onSubWindowsRootingButtonPressed(index),
                  style: flutter.TextButton.styleFrom(
                    shape: flutter.RoundedRectangleBorder(
                      borderRadius: flutter.BorderRadius.circular(16),
                    ),
                    backgroundColor: flutter.Colors.blueGrey[800],
                  ),
                  child: flutter.SizedBox(
                    height: 64,
                    child: flutter.Center(
                      child: flutter.Text(subWindowsTitle.values.toList()[index],
                          style: const flutter.TextStyle(color: flutter.Colors.white)),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) => const flutter.SizedBox(height: 16),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _onSubWindowsRootingButtonPressed(index) async {
    final pressedScreen = SubWindows.values[index];
    print(widget.windows);
    print("Sub windows rooting button has clicked: `$pressedScreen`.");

    if (!widget.windows.containsKey(pressedScreen)) { return; }

    await widget.windows[pressedScreen]?.show();
  }
}
