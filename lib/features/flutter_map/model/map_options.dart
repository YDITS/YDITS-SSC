//
// YDITS for SSC
//
// Copyright (C) よね/Yone
//
// https://github.com/YDITS/YDITS-SSC
//

import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

/// Default map options for general use.
final MapOptions normalMapOptions = MapOptions(
  initialCenter: const LatLng(51.5, -0.09),
  initialZoom: 5,
  cameraConstraint: CameraConstraint.contain(
    bounds: LatLngBounds(const LatLng(-90, -180), const LatLng(90, 180)),
  ),
);

/// Map options specifically for the EEW (Earthquake Early Warning) display.
final MapOptions eewMapOptions = MapOptions(
  initialCenter: const LatLng(51.5, -0.09),
  initialZoom: 5,
  cameraConstraint: CameraConstraint.contain(
    bounds: LatLngBounds(const LatLng(-90, -180), const LatLng(90, 180)),
  ),
);

/// Map options specifically for the Tsunami display.
final MapOptions tsunamiMapOptions = MapOptions(
  initialCenter: const LatLng(51.5, -0.09),
  initialZoom: 5,
  cameraConstraint: CameraConstraint.contain(
    bounds: LatLngBounds(const LatLng(-90, -180), const LatLng(90, 180)),
  ),
);
