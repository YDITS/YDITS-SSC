//
// YDITS for SSC
//
// Copyright (C) よね/Yone
//
// https://github.com/YDITS/YDITS-SSC
//

import 'package:flutter/material.dart';

enum SubWindows {
  eewMonitorDisplay,
  tsunamiMonitorDisplay,
  weatherEarthquakeTelopDisplay,
}

const Map<String, SubWindows> subWindowsStringToEnum = {
  "SubWindows.eewMonitorDisplay": SubWindows.eewMonitorDisplay,
  "SubWindows.tsunamiMonitorDisplay": SubWindows.tsunamiMonitorDisplay,
  "SubWindows.weatherEarthquakeTelopDisplay":
      SubWindows.weatherEarthquakeTelopDisplay,
};

const Map<SubWindows, IconData> subWindowIconData = {
    SubWindows.eewMonitorDisplay: Icons.warning_amber_rounded,
    SubWindows.tsunamiMonitorDisplay: Icons.tsunami,
    SubWindows.weatherEarthquakeTelopDisplay: Icons.notifications_active,
};

const Map<SubWindows, String> subWindowsTitle = {
  SubWindows.eewMonitorDisplay: "EEW Monitor Display",
  SubWindows.tsunamiMonitorDisplay: "Tsunami Monitor Display",
  SubWindows.weatherEarthquakeTelopDisplay: "Weather Earthquake Telop Display",
};
