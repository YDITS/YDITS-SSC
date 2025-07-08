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

/// A notifier for managing the telop settings.
@riverpod
class TelopSettings extends _$TelopSettings {
  @override
  TelopSettingsModel build() {
    return const TelopSettingsModel(displayModeOverride: defaultDisplayModeOverride);
  }

  /// The prefix for the storage keys used by this notifier.
  static const String storageKeyPrefix = 'telop_settings';

  /// The storage key for the display override mode.
  static const String displayOverrideModeStorageKey =
      '${storageKeyPrefix}_display_override_mode';

  /// The default display mode override.
  static const TelopDisplayMode defaultDisplayModeOverride = TelopDisplayMode.none;

  /// Sets the display mode override to the given [mode].
  ///
  /// This method persists the setting to secure storage and updates the state.
  Future<void> setDisplayModeOverride(TelopDisplayMode mode) async {
    try {
      await ref
          .read(storageProvider)
          .write(key: displayOverrideModeStorageKey, value: mode.toString());
      state = state.copyWith(newDisplayModeOverride: mode);
    } catch (error) {
      // Handle or log the error if writing to storage fails.
    }
  }
}
