//
// YDITS for SSC
//
// Copyright (C) よね/Yone
//
// https://github.com/YDITS/YDITS-SSC
//

import 'package:flutter/material.dart';
import 'package:ydits_ssc/features/features.dart';

final class TsunamiMonitorDisplayApp extends StatelessWidget {
  const TsunamiMonitorDisplayApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: EEWMonitorDisplayHomePage(),
    );
  }
}
