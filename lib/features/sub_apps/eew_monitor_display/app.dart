//
// YDITS for SSC
//
// Copyright (C) よね/Yone
//
// https://github.com/YDITS/YDITS-SSC
//

import 'package:flutter/material.dart';
import 'package:ydits_ssc/features/sub_apps/eew_monitor_display/pages/pages.dart';

final class EewMonitorDisplayApp extends StatelessWidget {
  const EewMonitorDisplayApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: EEWMonitorDisplayHomePage());
  }
}
