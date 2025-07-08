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

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TelopSettingsModel telopSettings = ref.watch(telopSettingsProvider);

    return Scaffold(
      body: Column(
        children: [
          // TelopDisplayModeRadio
          RadioListTile(
            value: TelopDisplayMode.earthquake,
            groupValue: telopSettings.displayModeOverride,
            title: Text(
              telopDisplayModeToText[TelopDisplayMode.earthquake] ?? "-",
            ),
            onChanged:
                (TelopDisplayMode? value) async =>
                    await _onTelopDisplayModeRadioChanged(value, ref),
          ),
          RadioListTile(
            value: TelopDisplayMode.eew,
            groupValue: telopSettings.displayModeOverride,
            title: Text(
              telopDisplayModeToText[TelopDisplayMode.eew] ?? "-",
            ),
            onChanged:
                (TelopDisplayMode? value) async =>
                    await _onTelopDisplayModeRadioChanged(value, ref),
          ),
          RadioListTile(
            value: TelopDisplayMode.none,
            groupValue: telopSettings.displayModeOverride,
            title: Text(
              telopDisplayModeToText[TelopDisplayMode.none] ?? "-",
            ),
            onChanged:
                (TelopDisplayMode? value) async =>
                    await _onTelopDisplayModeRadioChanged(value, ref),
          ),
          RadioListTile(
            value: TelopDisplayMode.tsunami,
            groupValue: telopSettings.displayModeOverride,
            title: Text(
              telopDisplayModeToText[TelopDisplayMode.tsunami] ?? "-",
            ),
            onChanged:
                (TelopDisplayMode? value) async =>
                    await _onTelopDisplayModeRadioChanged(value, ref),
          ),
          RadioListTile(
            value: TelopDisplayMode.weatherToday,
            groupValue: telopSettings.displayModeOverride,
            title: Text(
              telopDisplayModeToText[TelopDisplayMode.weatherToday] ?? "-",
            ),
            onChanged:
                (TelopDisplayMode? value) async =>
                    await _onTelopDisplayModeRadioChanged(value, ref),
          ),
          RadioListTile(
            value: TelopDisplayMode.weatherTommorow,
            groupValue: telopSettings.displayModeOverride,
            title: Text(
              telopDisplayModeToText[TelopDisplayMode.weatherTommorow] ?? "-",
            ),
            onChanged:
                (TelopDisplayMode? value) async =>
                    await _onTelopDisplayModeRadioChanged(value, ref),
          ),
        ],
      ),
    );
  }

  Future<void> _onTelopDisplayModeRadioChanged(
    TelopDisplayMode? value,
    WidgetRef ref,
  ) async {
    await ref
        .read(telopSettingsProvider.notifier)
        .setDisplayModeOverride(value ?? TelopDisplayMode.none);
  }
}
