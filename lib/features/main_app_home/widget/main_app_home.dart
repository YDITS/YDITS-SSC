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
import 'package:ydits_ssc/apps/main_app/model/main_app_config.dart';
import 'package:ydits_ssc/features/main_app_home/notifier/main_app_home_state_notifier.dart';
import 'package:ydits_ssc/features/main_app_home/widget/routes/window_launcher.dart';
import 'package:ydits_ssc/features/settings/widget/settings_page.dart';

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

  @override
  Widget build(BuildContext context) {
    Widget page;

    final int currentIndex =
        ref.watch(mainAppHomeStateProvider).currentNavigationIndex;

    switch (currentIndex) {
      case 0:
        page = WindowLauncher(windows: widget.windows);
        break;
      case 1:
        page = const SettingsPage();
        break;
      default:
        throw UnimplementedError(
          "There isn't widget for `$currentIndex` in MainAppHomePage.",
        );
    }

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 16, 16, 16),
      appBar: AppBar(
        title: Text(_config.title, style: const TextStyle(color: Colors.white)),
        backgroundColor: Colors.black87,
      ),
      body: Row(
        children: [
          SafeArea(
            child: NavigationRail(
              extended: false,
              destinations: const [
                NavigationRailDestination(
                  icon: Icon(Icons.home),
                  label: Text("ホーム"),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.settings),
                  label: Text("設定"),
                ),
              ],
              selectedIndex: currentIndex,
              onDestinationSelected: (value) {
                ref
                    .read(mainAppHomeStateProvider.notifier)
                    .setCurrentNavigationIndex(value);
              },
            ),
          ),
          Expanded(child: Container(child: page)),
        ],
      ),
    );
  }
}
