//
// YDITS for SSC
//
// Copyright (C) よね/Yone
//
// https://github.com/YDITS/YDITS-SSC
//

import 'package:flutter/material.dart';
import 'package:desktop_multi_window/desktop_multi_window.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:ydits_ssc/core/sub_windows/sub_windows.dart';
import 'package:ydits_ssc/core/widgets/copyright_footer/copyright_footer.dart';
import 'package:ydits_ssc/core/widgets/text_button_with_icon/text_button_with_icon.dart';
import 'package:ydits_ssc/apps/main_app/model/main_app_config.dart';

final class YditsSscMainAppHomePage extends ConsumerStatefulWidget {
  const YditsSscMainAppHomePage({super.key, required this.windows});

  final Map<SubWindows, WindowController> windows;

  @override
  ConsumerState<YditsSscMainAppHomePage> createState() =>
      _YditsSscMainAppHomePageState();
}

final class _YditsSscMainAppHomePageState
    extends ConsumerState<YditsSscMainAppHomePage> {
  final YditsSscAppConfig _config = YditsSscAppConfig();
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 16, 16, 16),
      appBar: AppBar(
        title: Text(_config.title, style: const TextStyle(color: Colors.white)),
        backgroundColor: Colors.black87,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 16),
          const Center(
            child: Text(
              "Window Launcher",
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(32, 0, 32, 0),
              child: ScrollbarTheme(
                data: const ScrollbarThemeData(
                  thumbColor: WidgetStatePropertyAll(
                    Color.fromARGB(255, 127, 127, 127),
                  ),
                ),
                child: Scrollbar(
                  thumbVisibility: true,
                  controller: _scrollController,
                  child: ListView.separated(
                    controller: _scrollController,
                    itemCount: SubWindows.values.length + 1,
                    itemBuilder: (BuildContext context, int index) {
                      // 最後の要素の後にはContainerを返し、separatorを適用させる
                      if (index == SubWindows.values.length) {
                        return Container();
                      }

                      return Center(
                        child: SizedBox(
                          width: 384,
                          child: windowsRootingButton(index),
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(height: 24);
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

  TextButtonWithIcon windowsRootingButton(index) {
    final SubWindows pressedScreen = SubWindows.values[index];
    final IconData iconData =
        subWindowIconData[pressedScreen] ?? Icons.question_mark;

    return TextButtonWithIcon(
      iconData: iconData,
      onPressed: () => _onSubWindowsRootingButtonPressed(pressedScreen),
      child: Text(
        subWindowsTitle.values.toList()[index],
        style: const TextStyle(fontSize: 20, color: Colors.white),
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
