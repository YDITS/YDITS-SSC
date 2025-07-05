//
// YDITS for SSC
//
// Copyright (C) よね/Yone
//
// https://github.com/YDITS/YDITS-SSC
//

import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

final MapOptions normalMapOptions = MapOptions(
  initialCenter: const LatLng(51.5, -0.09),
  initialZoom: 5,
  cameraConstraint: CameraConstraint.contain(
    bounds: LatLngBounds(const LatLng(-90, -180), const LatLng(90, 180)),
  ),
);

final MapOptions eewMapOptions = MapOptions(
  initialCenter: const LatLng(51.5, -0.09),
  initialZoom: 5,
  cameraConstraint: CameraConstraint.contain(
    bounds: LatLngBounds(const LatLng(-90, -180), const LatLng(90, 180)),
  ),
);

final tsunamiMapOptions = MapOptions(
  initialCenter: const LatLng(51.5, -0.09),
  initialZoom: 5,
  cameraConstraint: CameraConstraint.contain(
    bounds: LatLngBounds(const LatLng(-90, -180), const LatLng(90, 180)),
  ),
);
