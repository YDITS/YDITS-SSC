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
import 'package:ydits_ssc/apps/main_app/model/main_app_config.dart';
import 'package:ydits_ssc/apps/main_app/provider/main_app_config_provider.dart';
import 'package:ydits_ssc/core/providers/theme/model/theme_model.dart';
import 'package:ydits_ssc/core/providers/theme/notifier/theme_notifier.dart';
import 'package:ydits_ssc/core/sub_windows/sub_windows.dart';
import 'package:ydits_ssc/features/main_app_home/notifier/main_app_home_state_notifier.dart';
import 'package:ydits_ssc/features/main_app_home/widget/routes/window_launcher.dart';
import 'package:ydits_ssc/features/settings/widget/settings_page.dart';

/// The home page widget for the main YDITS for SSC application.
class YditsSscMainAppHomePage extends ConsumerWidget {
  const YditsSscMainAppHomePage({required this.windows, super.key});

  /// A map of sub-window controllers.
  final Map<SubWindows, WindowController> windows;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final YditsSscAppConfig config = ref.watch(yditsSscAppConfigProvider);
    final ThemeModel theme = ref.watch(themeProvider);
    final int currentIndex =
        ref.watch(mainAppHomeStateProvider).currentNavigationIndex;

    final List<ConsumerWidget> pages = <ConsumerWidget>[
      WindowLauncher(windows: windows),
      const SettingsPage(),
    ];

    return Scaffold(
      backgroundColor: theme.darkBackground,
      appBar: AppBar(
        title: Text(config.title),
        backgroundColor: const Color.fromARGB(255, 8, 8, 8),
        foregroundColor: theme.darkForeground,
      ),
      body: Row(
        children: <Widget>[
          SafeArea(
            child: NavigationRail(
              backgroundColor: theme.darkBackground,
              extended: false,
              destinations: const <NavigationRailDestination>[
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
              onDestinationSelected: (int value) {
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
