//
// YDITS for SSC
//
// Copyright (C) よね/Yone
//
// https://github.com/YDITS/YDITS-SSC
//

import 'package:flutter/material.dart';
import 'package:desktop_multi_window/desktop_multi_window.dart';
import 'package:ydits_ssc/core/core.dart';

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
      backgroundColor: const Color.fromARGB(255, 16, 16, 16),
      appBar: AppBar(
        title: Text(widget.title, style: const TextStyle(color: Colors.white)),
        backgroundColor: Colors.black87,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          gap2f(),
          Center(
            child: Text(
              widget.title,
              style: const TextStyle(fontSize: 16 * 2, color: Colors.white),
            ),
          ),
          gap2f(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(32, 0, 32, 0),
              child: Center(
                child: SizedBox(
                  width: 384,
                  height: null,
                  child: ListView.separated(
                    itemCount: 3,
                    itemBuilder:
                        (context, index) => windowsRootingButton(index),
                    separatorBuilder: (context, index) {
                      return const SizedBox(width: null, height: 32);
                    },
                  ),
                ),
              ),
            ),
          ),
          const CopyrightFooter(),
        ],
      ),
    );
  }

  SizedBox gap() => const SizedBox(width: null, height: 16);
  SizedBox gap2f() => const SizedBox(width: null, height: 32);

  final Map<SubWindows, IconData> subWindowToIconData = {
    SubWindows.eewMonitorDisplay: Icons.warning_amber_rounded,
    SubWindows.tsunamiMonitorDisplay: Icons.tsunami,
    SubWindows.weatherEarthquakeTelopDisplay: Icons.notifications_active,
  };

  IconWithTextButton windowsRootingButton(index) {
    final SubWindows pressedScreen = SubWindows.values[index];
    final IconData iconData =
        subWindowToIconData[pressedScreen] ?? Icons.question_mark;

    return IconWithTextButton(
      onPressed: () => _onSubWindowsRootingButtonPressed(pressedScreen),
      children: [
        Icon(iconData, size: 64),
        gap(),
        Center(
          child: Text(
            subWindowsTitle.values.toList()[index],
            style: const TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
      ],
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
