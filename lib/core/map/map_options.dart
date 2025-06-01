//
// YDITS for SSC
//
// Copyright (C) よね/Yone
//
// https://github.com/YDITS/YDITS-SSC
//

import 'package:flutter_map/flutter_map.dart' as flutter_map;
import 'package:latlong2/latlong.dart' as latlong;

abstract final class OriginMapOptions {
  static final flutter_map.MapOptions normal = flutter_map.MapOptions(
    initialCenter: const latlong.LatLng(51.5, -0.09),
    initialZoom: 5,
    cameraConstraint: flutter_map.CameraConstraint.contain(
      bounds: flutter_map.LatLngBounds(
        const latlong.LatLng(-90, -180),
        const latlong.LatLng(90, 180),
      ),
    ),
  );

  static final flutter_map.MapOptions eew = flutter_map.MapOptions(
    initialCenter: const latlong.LatLng(51.5, -0.09),
    initialZoom: 5,
    cameraConstraint: flutter_map.CameraConstraint.contain(
      bounds: flutter_map.LatLngBounds(
        const latlong.LatLng(-90, -180),
        const latlong.LatLng(90, 180),
      ),
    ),
  );

  static final flutter_map.MapOptions tsunami = flutter_map.MapOptions(
    initialCenter: const latlong.LatLng(51.5, -0.09),
    initialZoom: 5,
    cameraConstraint: flutter_map.CameraConstraint.contain(
      bounds: flutter_map.LatLngBounds(
        const latlong.LatLng(-90, -180),
        const latlong.LatLng(90, 180),
      ),
    ),
  );
}
