//
// YDITS for SSC
//
// Copyright (C) よね/Yone
//
// https://github.com/YDITS/YDITS-SSC
//

import 'package:flutter/material.dart';

final class EEWMonitorDisplayHomePage extends StatefulWidget {
  const EEWMonitorDisplayHomePage({super.key});

  @override
  State<EEWMonitorDisplayHomePage> createState() => _HomePage();
}

final class _HomePage extends State<EEWMonitorDisplayHomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('EEWMonitorDisplay')),
      body: const Center(child: Text('EEWMonitorDisplay')),
    );
  }
}
