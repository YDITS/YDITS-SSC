//
// YDITS for SSC
//
// Copyright (C) よね/Yone
//
// https://github.com/YDITS/YDITS-SSC
//

final class WeatherStateModel {
  const WeatherStateModel({this.telopText = defaultTelopText});

  final String telopText;
  static const String defaultTelopText = "";

  WeatherStateModel copyWith({String? newTelopText}) =>
      WeatherStateModel(telopText: newTelopText ?? telopText);
}
