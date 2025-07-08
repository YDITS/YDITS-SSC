//
// YDITS for SSC
//
// Copyright (C) よね/Yone
//
// https://github.com/YDITS/YDITS-SSC
//

import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ydits_ssc/features/flutter_map/model/map_options.dart';
import 'package:ydits_ssc/features/flutter_map/model/map_types.dart';

part 'map_options_provider.g.dart';

/// A provider that returns the appropriate [MapOptions] based on the given [MapTypes].
@riverpod
MapOptions mapOptions(_, MapTypes mapType) {
  switch (mapType) {
    case MapTypes.normal:
      return normalMapOptions;
    case MapTypes.eew:
      return eewMapOptions;
    case MapTypes.tsunami:
      return tsunamiMapOptions;
  }
}
