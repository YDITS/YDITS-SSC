//
// YDITS for SSC
//
// Copyright (C) よね/Yone
//
// https://github.com/YDITS/YDITS-SSC
//

import 'package:flutter/material.dart';
import 'package:ydits_ssc/features/sub_apps/tsunami_monitor_display/pages/pages.dart';

final class TsunamiMonitorDisplayHomePage extends StatefulWidget {
  const TsunamiMonitorDisplayHomePage({super.key});

  @override
  State<TsunamiMonitorDisplayHomePage> createState() => _HomePage();
}

final class _HomePage extends State<TsunamiMonitorDisplayHomePage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget page;

    switch (selectedIndex) {
      case 0:
        page = const MapPage();
        break;
      case 1:
        page = const MenuPage();
        break;
      default:
        throw UnimplementedError("There isn't widget for `$selectedIndex`.");
    }

    return Scaffold(
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
                  icon: Icon(Icons.menu),
                  label: Text("メニュー"),
                ),
              ],
              selectedIndex: selectedIndex,
              onDestinationSelected: (value) {
                setState(() {
                  selectedIndex = value;
                });
              },
            ),
          ),
          Expanded(
            child: Container(
              color: Theme.of(context).colorScheme.primaryContainer,
              child: page,
            ),
          ),
        ],
      ),
    );
  }
}
