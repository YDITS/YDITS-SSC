//
// YDITS for SSC
//
// Copyright (C) よね/Yone
//
// https://github.com/YDITS/YDITS-SSC
//

import 'package:flutter/material.dart';

/// An enumeration of the available sub-windows in the application.
enum SubWindows {
  /// The Earthquake Early Warning (EEW) monitor display.
  eewMonitorDisplay,

  /// The Tsunami monitor display.
  tsunamiMonitorDisplay,

  /// The weather and earthquake telop display.
  weatherEarthquakeTelopDisplay,
}

/// A map to convert a string representation of a sub-window to its [SubWindows] enum.
Map<String, SubWindows> subWindowsStringToEnum = {
  SubWindows.eewMonitorDisplay.toString(): SubWindows.eewMonitorDisplay,
  SubWindows.tsunamiMonitorDisplay.toString(): SubWindows.tsunamiMonitorDisplay,
  SubWindows.weatherEarthquakeTelopDisplay.toString():
      SubWindows.weatherEarthquakeTelopDisplay,
};

/// A map that associates each [SubWindows] with an icon.
const Map<SubWindows, IconData> subWindowIconData = {
  SubWindows.eewMonitorDisplay: Icons.warning_amber_rounded,
  SubWindows.tsunamiMonitorDisplay: Icons.tsunami,
  SubWindows.weatherEarthquakeTelopDisplay: Icons.notifications_active,
};

/// A map that provides a title for each [SubWindows].
const Map<SubWindows, String> subWindowsTitle = {
  SubWindows.eewMonitorDisplay: 'EEW Monitor Display',
  SubWindows.tsunamiMonitorDisplay: 'Tsunami Monitor Display',
  SubWindows.weatherEarthquakeTelopDisplay: 'Weather Earthquake Telop Display',
};
