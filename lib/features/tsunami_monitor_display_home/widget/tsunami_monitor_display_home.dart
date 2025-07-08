//
// YDITS for SSC
//
// Copyright (C) よね/Yone
//
// https://github.com/YDITS/YDITS-SSC
//

import 'package:flutter/material.dart';
import 'package:ydits_ssc/features/tsunami_monitor_display_home/widget/routes/map.dart';
import 'package:ydits_ssc/features/tsunami_monitor_display_home/widget/routes/menu.dart';

/// The home page widget for the Tsunami Monitor Display.
class TsunamiMonitorDisplayHomePage extends StatefulWidget {
  const TsunamiMonitorDisplayHomePage({super.key});

  @override
  State<TsunamiMonitorDisplayHomePage> createState() => _HomePageState();
}

class _HomePageState extends State<TsunamiMonitorDisplayHomePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final pages = <Widget>[
      const MapPage(),
      const MenuPage(),
    ];

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
              selectedIndex: _selectedIndex,
              onDestinationSelected: (value) {
                setState(() {
                  _selectedIndex = value;
                });
              },
            ),
          ),
          Expanded(
            child: Container(
              color: Theme.of(context).colorScheme.primaryContainer,
              child: pages[_selectedIndex],
            ),
          ),
        ],
      ),
    );
  }
}
