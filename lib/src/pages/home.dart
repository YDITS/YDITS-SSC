//
// YDITS for SSC
//
// Copyright (C) よね/Yone
//
// https://github.com/YDITS/YDITS-SSC
//

import 'package:flutter/material.dart';
import 'package:desktop_multi_window/desktop_multi_window.dart';
import 'package:ydits_ssc/core/sub_windows/sub_windows.dart';
import 'package:ydits_ssc/core/sub_windows/sub_windows_title.dart';

final class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title, required this.windows});

  final String title;
  final Map<SubWindows, WindowController> windows;

  @override
  State<HomePage> createState() => HomePageState();
}

final class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: const TextStyle(color: Colors.white70),
        ),
        backgroundColor: Colors.black87,
      ),
      body: Column(
        children: [
          const SizedBox(width: null, height: 16 * 2),
          Text(
            widget.title,
            style: const TextStyle(fontSize: 16 * 2, color: Colors.black87),
          ),
          const SizedBox(width: null, height: 16 * 2),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(32, 0, 32, 0),
              child: Center(
                child: SizedBox(
                  width: 769,
                  height: null,
                  child: ListView.separated(
                    itemCount: 3,
                    itemBuilder:
                        (context, index) => windowsRootingButton(index),
                    separatorBuilder: (context, index) {
                      return const SizedBox(width: null, height: 16 * 1.5);
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  TextButton windowsRootingButton(index) {
    final pressedScreen = SubWindows.values[index];

    return TextButton(
      onPressed: () => _onSubWindowsRootingButtonPressed(pressedScreen),
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        backgroundColor: Colors.blueGrey[800],
      ),
      child: SizedBox(
        height: 16 * 4,
        child: Center(
          child: Text(
            subWindowsTitle.values.toList()[index],
            style: const TextStyle(fontSize: 16, color: Colors.white),
          ),
        ),
      ),
    );
  }

  Future<void> _onSubWindowsRootingButtonPressed(
    SubWindows pressedScreen,
  ) async {
    print(widget.windows);
    print("Sub windows rooting button has clicked: `$pressedScreen`.");

    if (!widget.windows.containsKey(pressedScreen)) {
      return;
    }

    await widget.windows[pressedScreen]?.show();
  }
}
