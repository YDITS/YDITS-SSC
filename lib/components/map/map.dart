//
// YDITS for SSC
//
// Copyright (C) よね/Yone
//
// https://github.com/YDITS/YDITS-SSC
//

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';

class Map extends StatefulWidget {
  const Map({
    super.key,
    required this.mapOptions,
  });

  final MapOptions mapOptions;

  @override
  State<Map> createState() => _Map();
}

class _Map extends State<Map> {
  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: widget.mapOptions,
      children: [
        TileLayer(
            urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
            userAgentPackageName: "com.yoneyo.tests.ydits-ssc",
        ),
        RichAttributionWidget(
            popupInitialDisplayDuration: const Duration(seconds: 5),
            animationConfig: const ScaleRAWA(),
            showFlutterMapAttribution: false,
            attributions: [
                TextSourceAttribution(
                    'OpenStreetMap contributors',
                    onTap: () async => {}
                ),
                const TextSourceAttribution(
                    'This attribution is the same throughout this app, except '
                    'where otherwise specified',
                    prependCopyright: false,
                ),
            ],
        ),
      ],
    );
  }
}
