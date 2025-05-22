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

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
    required this.title,
    required this.windows,
  });

  final String title;
  final Map<SubWindows, WindowController> windows;

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Text(widget.title,
              style: const TextStyle(fontSize: 24)),
          const SizedBox(
            height: 24,
          ),
          Expanded(
            child: ListView.separated(
              itemCount: 3,
              itemBuilder: (context, index) {
                final pressedScreen = SubWindows.values[index];

                return TextButton(
                  onPressed: () => _onSubWindowsRootingButtonPressed(pressedScreen),
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    backgroundColor: Colors.blueGrey[800],
                  ),
                  child: SizedBox(
                    height: 64,
                    child: Center(
                      child: Text(
                          subWindowsTitle.values.toList()[index],
                          style: const TextStyle(
                              color: Colors.white)),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) =>
                  const SizedBox(height: 16),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _onSubWindowsRootingButtonPressed(SubWindows pressedScreen) async {
    print(widget.windows);
    print("Sub windows rooting button has clicked: `$pressedScreen`.");

    if (!widget.windows.containsKey(pressedScreen)) {
      return;
    }

    await widget.windows[pressedScreen]?.show();
  }
}
