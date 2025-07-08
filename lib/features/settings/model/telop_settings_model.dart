//
// YDITS for SSC
//
// Copyright (C) よね/Yone
//
// https://github.com/YDITS/YDITS-SSC
//

/// A data model for telop settings.
final class TelopSettingsModel {
  /// Creates a [TelopSettingsModel].
  const TelopSettingsModel({required this.displayModeOverride});

  /// The display mode override for the telop.
  final TelopDisplayMode displayModeOverride;

  /// Creates a copy of this model with the given fields replaced with new values.
  TelopSettingsModel copyWith({TelopDisplayMode? newDisplayModeOverride}) {
    return TelopSettingsModel(
      displayModeOverride: newDisplayModeOverride ?? displayModeOverride,
    );
  }
}

/// An enumeration of the possible display modes for the telop.
enum TelopDisplayMode {
  /// No override, the default behavior is used.
  none,

  /// Displays tomorrow's weather.
  weatherTommorow,

  /// Displays today's weather.
  weatherToday,

  /// Displays EEW (Earthquake Early Warning) information.
  eew,

  /// Displays earthquake information.
  earthquake,

  /// Displays tsunami information.
  tsunami,
}

/// A map to convert a string representation of a telop display mode to its [TelopDisplayMode] enum.
final Map<String, TelopDisplayMode> telopDisplayModeStringToEnum = {
  TelopDisplayMode.none.toString(): TelopDisplayMode.none,
  TelopDisplayMode.weatherTommorow.toString(): TelopDisplayMode.weatherTommorow,
  TelopDisplayMode.weatherToday.toString(): TelopDisplayMode.weatherToday,
  TelopDisplayMode.eew.toString(): TelopDisplayMode.eew,
  TelopDisplayMode.earthquake.toString(): TelopDisplayMode.earthquake,
  TelopDisplayMode.tsunami.toString(): TelopDisplayMode.tsunami,
};

/// A map that provides a human-readable text for each [TelopDisplayMode].
const Map<TelopDisplayMode, String> telopDisplayModeToText = {
  TelopDisplayMode.none: 'Do not override',
  TelopDisplayMode.weatherTommorow: "Tomorrow's Weather",
  TelopDisplayMode.weatherToday: "Today's Weather",
  TelopDisplayMode.eew: 'Earthquake Early Warning',
  TelopDisplayMode.earthquake: 'Earthquake Information',
  TelopDisplayMode.tsunami: 'Tsunami Information',
};
