//
// YDITS for SSC
//
// Copyright (C) よね/Yone
//
// https://github.com/YDITS/YDITS-SSC
//

final class TelopSettingsModel {
  const TelopSettingsModel({required this.displayModeOverride});

  final TelopDisplayMode displayModeOverride;

  TelopSettingsModel copyWith({TelopDisplayMode? newDisplayModeOverride}) {
    return TelopSettingsModel(
      displayModeOverride: newDisplayModeOverride ?? displayModeOverride,
    );
  }
}

enum TelopDisplayMode {
  none,
  weatherTommorow,
  weatherToday,
  eew,
  earthquake,
  tsunami,
}

Map<String, TelopDisplayMode> telopDisplayModeStringToEnum = {
  TelopDisplayMode.none.toString(): TelopDisplayMode.none,
};

Map<TelopDisplayMode, String> telopDisplayModeToText = {
  TelopDisplayMode.none: "オーバーライドしない",
  TelopDisplayMode.weatherTommorow: "明日の天気",
  TelopDisplayMode.weatherToday: "今日の天気",
  TelopDisplayMode.eew: "緊急地震速報",
  TelopDisplayMode.earthquake: "地震情報",
  TelopDisplayMode.tsunami: "津波情報",
};
