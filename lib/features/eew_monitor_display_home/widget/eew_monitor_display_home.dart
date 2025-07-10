//
// YDITS for SSC
//
// Copyright (C) よね/Yone
//
// https://github.com/YDITS/YDITS-SSC
//

import 'package:flutter/material.dart';

/// The home page widget for the EEW (Earthquake Early Warning) Monitor Display.
class EEWMonitorDisplayHomePage extends StatefulWidget {
  const EEWMonitorDisplayHomePage({super.key});

  @override
  State<EEWMonitorDisplayHomePage> createState() => _HomePageState();
}

/// The private state class for the EEW Monitor Display home page.
class _HomePageState extends State<EEWMonitorDisplayHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('EEW Monitor Display')),
      body: const Center(child: Text('EEW Monitor Display')),
    );
  }
}
