//
// YDITS for SSC
//
// Copyright (C) よね/Yone
//
// https://github.com/YDITS/YDITS-SSC
//

import 'package:flutter/material.dart';
import 'package:ydits_ssc/features/tsunami_monitor_display_home/widget/tsunami_monitor_display_home.dart';

/// The root widget for the Tsunami Monitor Display application.
final class TsunamiMonitorDisplayApp extends StatelessWidget {
  const TsunamiMonitorDisplayApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: TsunamiMonitorDisplayHomePage());
  }
}
