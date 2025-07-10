//
// YDITS for SSC
//
// Copyright (C) よね/Yone
//
// https://github.com/YDITS/YDITS-SSC
//

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:ydits_ssc/features/flutter_map/model/map_types.dart';
import 'package:ydits_ssc/features/flutter_map/provider/flutter_map_url_template_provider.dart';
import 'package:ydits_ssc/features/flutter_map/provider/flutter_map_user_agent_package_name_provider.dart';
import 'package:ydits_ssc/features/flutter_map/provider/map_options_provider.dart';

/// A widget that displays a map using FlutterMap.
class YditsSscFlutterMap extends ConsumerStatefulWidget {
  const YditsSscFlutterMap({super.key});

  @override
  ConsumerState<YditsSscFlutterMap> createState() => _FlutterMapState();
}

/// The private state class for the [YditsSscFlutterMap] widget.
class _FlutterMapState extends ConsumerState<YditsSscFlutterMap> {
  @override
  Widget build(BuildContext context) {
    final userAgentPackageName = ref.watch(
      flutterMapUserAgentPackageNameProvider,
    );
    final urlTemplate = ref.watch(flutterMapUrlTemplateProvider);
    final mapOptions = ref.watch(
      mapOptionsProvider(MapTypes.tsunami), // Default to tsunami map
    );

    return FlutterMap(
      options: mapOptions,
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
            TextSourceAttribution(
              'OpenStreetMap contributors',
              onTap: () async {},
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
