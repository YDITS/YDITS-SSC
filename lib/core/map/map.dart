//
// YDITS for SSC
//
// Copyright (C) よね/Yone
//
// https://github.com/YDITS/YDITS-SSC
//

import 'package:flutter/material.dart' as flutter;
import 'package:flutter_map/flutter_map.dart' as flutter_map;

final class FlutterMap extends flutter.StatefulWidget {
  const FlutterMap({
    super.key,
    required this.mapOptions,
  });

  final flutter_map.MapOptions mapOptions;

  @override
  flutter.State<FlutterMap> createState() => FlutterMapState();
}

final class FlutterMapState extends flutter.State<FlutterMap> {
  @override
  flutter.Widget build(flutter.BuildContext context) {
    return flutter_map.FlutterMap(
      options: widget.mapOptions,
      children: [
        flutter_map.TileLayer(
          urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
          userAgentPackageName: "com.yoneyo.tests.ydits-ssc",
        ),
        flutter_map.RichAttributionWidget(
          popupInitialDisplayDuration: const Duration(seconds: 5),
          animationConfig: const flutter_map.ScaleRAWA(),
          showFlutterMapAttribution: false,
          attributions: [
            flutter_map.TextSourceAttribution('OpenStreetMap contributors',
                onTap: () async => {}),
            const flutter_map.TextSourceAttribution(
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
