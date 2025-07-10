//
// YDITS for SSC
//
// Copyright (C) よね/Yone
//
// https://github.com/YDITS/YDITS-SSC
//

import 'package:desktop_multi_window/desktop_multi_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:ydits_ssc/apps/main_app/provider/main_app_config_provider.dart';
import 'package:ydits_ssc/core/sub_windows/sub_windows.dart';
import 'package:ydits_ssc/features/main_app_home/notifier/main_app_home_state_notifier.dart';
import 'package:ydits_ssc/features/main_app_home/widget/routes/window_launcher.dart';
import 'package:ydits_ssc/features/settings/widget/settings_page.dart';

/// The home page widget for the main YDITS for SSC application.
class YditsSscMainAppHomePage extends ConsumerWidget {
  const YditsSscMainAppHomePage({super.key, required this.windows});

  /// A map of sub-window controllers.
  final Map<SubWindows, WindowController> windows;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final config = ref.watch(yditsSscAppConfigProvider);
    final currentIndex = ref.watch(mainAppHomeStateProvider).currentNavigationIndex;

    final pages = [
      WindowLauncher(windows: windows),
      const SettingsPage(),
    ];

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 16, 16, 16),
      appBar: AppBar(
        title: Text(config.title, style: const TextStyle(color: Colors.white)),
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
          Expanded(child: pages[currentIndex]),
        ],
      ),
    );
  }
}
