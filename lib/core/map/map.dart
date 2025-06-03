//
// YDITS for SSC
//
// Copyright (C) よね/Yone
//
// https://github.com/YDITS/YDITS-SSC
//

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:ydits_ssc/core/core.dart';

final class YditsSscFlutterMap extends ConsumerStatefulWidget {
  const YditsSscFlutterMap({
    super.key,
    required this.mapOptions,
  });

  final MapOptions mapOptions;

  @override
  ConsumerState<YditsSscFlutterMap> createState() => FlutterMapState();
}

final class FlutterMapState extends ConsumerState<YditsSscFlutterMap> {
  @override
  Widget build(BuildContext context) {
    final String userAgentPackageName = ref.watch(flutterMapUserAgentPackageNameProvider);
    final String urlTemplate = ref.watch(flutterMapUrlTemplateProvider);

    return FlutterMap(
      options: widget.mapOptions,
      children: [
        TileLayer(
          urlTemplate: urlTemplate,
          userAgentPackageName: userAgentPackageName,
        ),
        RichAttributionWidget(
          popupInitialDisplayDuration: const Duration(seconds: 5),
          animationConfig: const ScaleRAWA(),
          showFlutterMapAttribution: false,
          attributions: [
            TextSourceAttribution('OpenStreetMap contributors',
                onTap: () async => {}),
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
