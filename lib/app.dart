//
// YDITS for SSC
//
// Copyright (C) よね/Yone
//
// https://github.com/YDITS/YDITS-SSC
//

import 'package:flutter/material.dart';
import 'config.dart';
import 'pages/pages.dart';

class YditsSscApp extends StatelessWidget {
  const YditsSscApp({
    super.key,
    required this.config,
  });

  final YditsSscConfig config;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(
        title: config.title,
      ),
    );
  }
}
