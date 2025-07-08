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
