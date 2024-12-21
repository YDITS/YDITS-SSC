//
// YDITS for SSC
//
// Copyright (C) よね/Yone
//
// https://github.com/YDITS/YDITS-SSC
//

import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:ydits_ssc/weather_earthquake_telop_display/pages/pages.dart';

class App extends StatelessWidget {
  final Logger logger;

  const App({super.key, required this.logger});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(logger: logger),
    );
  }
}
