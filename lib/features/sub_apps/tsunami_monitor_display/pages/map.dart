//
// YDITS for SSC
//
// Copyright (C) よね/Yone
//
// https://github.com/YDITS/YDITS-SSC
//

import 'package:flutter/material.dart';
import 'package:ydits_ssc/core/components/flutter_map/flutter_map.dart';
import 'package:ydits_ssc/core/map/map_options.dart';

final class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPage();
}

final class _MapPage extends State<MapPage> {
  @override
  Widget build(BuildContext context) {
    return YditsSscFlutterMap(
      mapOptions: OriginMapOptions.tsunami,
    );
  }
}
