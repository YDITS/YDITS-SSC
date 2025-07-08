//
// YDITS for SSC
//
// Copyright (C) よね/Yone
//
// https://github.com/YDITS/YDITS-SSC
//

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ydits_ssc/core/providers/flutter_secure_storage/flutter_secure_storage_provider.dart';
import 'package:ydits_ssc/features/settings/model/telop_settings_model.dart';

part 'telop_settings_notifier.g.dart';

@riverpod
class TelopSettings extends _$TelopSettings {
  @override
  TelopSettingsModel build() {
    return TelopSettingsModel(displayModeOverride: defaultDisplayModeOverride);
  }

  static String storageKeyPrifix = "telop_settings";
  static String displayOverrideModeStorageKey = "${storageKeyPrifix}_display_override_mode";

  static TelopDisplayMode defaultDisplayModeOverride = TelopDisplayMode.none;

  Future<void> setDisplayModeOverride(TelopDisplayMode mode) async {
    try {
      await ref.read(storageProvider).write(key: displayOverrideModeStorageKey, value: mode.toString());
      state = state.copyWith(newDisplayModeOverride: mode);
    } catch (error) {
    }
  }
}
