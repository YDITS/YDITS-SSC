//
// YDITS for SSC
//
// Copyright (C) よね/Yone
//
// https://github.com/YDITS/YDITS-SSC
//

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ydits_ssc/features/settings/model/telop_settings_model.dart';
import 'package:ydits_ssc/features/settings/notifier/telop_settings_notifier.dart';

/// A page for configuring various settings in the application.
class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final telopSettings = ref.watch(telopSettingsProvider);

    return Scaffold(
      body: ListView(
        children: TelopDisplayMode.values.map((mode) {
          return RadioListTile<TelopDisplayMode>(
            value: mode,
            groupValue: telopSettings.displayModeOverride,
            title: Text(telopDisplayModeToText[mode] ?? '-'),
            onChanged: (value) => _onTelopDisplayModeRadioChanged(value, ref),
          );
        }).toList(),
      ),
    );
  }

  /// Handles changes to the telop display mode radio buttons.
  Future<void> _onTelopDisplayModeRadioChanged(
    TelopDisplayMode? value,
    WidgetRef ref,
  ) async {
    if (value != null) {
      await ref
          .read(telopSettingsProvider.notifier)
          .setDisplayModeOverride(value);
    }
  }
}
