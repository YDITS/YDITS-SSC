//
// YDITS for SSC
//
// Copyright (C) よね/Yone
//
// https://github.com/YDITS/YDITS-SSC
//

/// A data model representing the state of the weather information.
final class WeatherStateModel {
  const WeatherStateModel({this.telopText = defaultTelopText});

  /// The text to be displayed in the weather telop.
  final String telopText;

  /// The default text for the telop.
  static const String defaultTelopText = '';

  /// Creates a copy of this model with the given fields replaced with new values.
  WeatherStateModel copyWith({String? newTelopText}) =>
      WeatherStateModel(telopText: newTelopText ?? telopText);
}
