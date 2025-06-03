//
// YDITS for SSC
//
// Copyright (C) よね/Yone
//
// https://github.com/YDITS/YDITS-SSC
//

import 'package:flutter/material.dart';
import 'package:ydits_ssc/core/core.dart';

final class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPage();
}

final class _MapPage extends State<MapPage> {
  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      mapOptions: OriginMapOptions.tsunami,
    );
  }
}
