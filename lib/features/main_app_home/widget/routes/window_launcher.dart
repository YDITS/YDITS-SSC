//
// YDITS for SSC
//
// Copyright (C) よね/Yone
//
// https://github.com/YDITS/YDITS-SSC
//

import 'package:desktop_multi_window/desktop_multi_window.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ydits_ssc/core/sub_windows/sub_windows.dart';
import 'package:ydits_ssc/core/widgets/copyright_footer/copyright_footer.dart';
import 'package:ydits_ssc/core/widgets/text_button_with_icon/text_button_with_icon.dart';

/// A widget that provides a launcher for the various sub-windows.
class WindowLauncher extends ConsumerWidget {
  WindowLauncher({required this.windows, super.key});

  /// A map of sub-window controllers.
  final Map<SubWindows, WindowController> windows;
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        const SizedBox(height: 16),
        const Center(
          child: Text(
            'Window Launcher',
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
        ),
        const SizedBox(height: 16),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: ScrollbarTheme(
              data: const ScrollbarThemeData(
                thumbColor: WidgetStatePropertyAll<Color?>(
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
                        child: _buildWindowButton(index),
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
    );
  }

  /// Builds a button for a specific sub-window.
  Widget _buildWindowButton(int index) {
    final SubWindows subWindow = SubWindows.values[index];
    final IconData iconData =
        subWindowIconData[subWindow] ?? Icons.question_mark;
    final String title = subWindowsTitle[subWindow] ?? 'Unknown';

    return TextButtonWithIcon(
      iconData: iconData,
      onPressed: () => _onSubWindowButtonPressed(subWindow),
      child: Text(
        title,
        style: const TextStyle(fontSize: 20, color: Colors.white),
      ),
    );
  }

  /// Handles the press of a sub-window button.
  Future<void> _onSubWindowButtonPressed(SubWindows subWindow) async {
    if (kDebugMode) {
      debugPrint('Sub-window button pressed: `$subWindow`');
    }

    final WindowController? controller = windows[subWindow];
    if (controller != null) {
      await controller.show();
    } else {
      if (kDebugMode) {
        debugPrint('No controller found for window: `$subWindow`');
      }
    }
  }
}
