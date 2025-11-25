//
// YDITS for SSC
//
// Copyright (C) よね/Yone
//
// https://github.com/YDITS/YDITS-SSC
//

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ydits_ssc/core/providers/theme/model/theme_model.dart';
import 'package:ydits_ssc/core/providers/theme/notifier/theme_notifier.dart';
import 'package:ydits_ssc/features/settings/model/telop_settings_model.dart';
import 'package:ydits_ssc/features/settings/notifier/telop_settings_notifier.dart';

/// A page for configuring various settings in the application.
class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TelopSettingsModel telopSettings = ref.watch(telopSettingsProvider);
    final ThemeModel theme = ref.watch(themeProvider);

    return RadioGroup<TelopDisplayMode>(
      groupValue: telopSettings.displayModeOverride,
      onChanged:
          (TelopDisplayMode? value) =>
              _onTelopDisplayModeRadioChanged(value, ref),
      child: Column(
        children:
            TelopDisplayMode.values.map((TelopDisplayMode mode) {
              return RadioListTile<TelopDisplayMode>(
                value: mode,
                title: Text(
                  telopDisplayModeToText[mode] ?? '-',
                  style: TextStyle(color: theme.darkForeground),
                ),
              );
            }).toList(),
      ),
    );

    // return ListView(
    //   children:
    //       TelopDisplayMode.values.map((TelopDisplayMode mode) {
    //         return RadioListTile<TelopDisplayMode>(
    //           value: mode,
    //           groupValue: telopSettings.displayModeOverride,
    //           title: Text(
    //             telopDisplayModeToText[mode] ?? '-',
    //             style: TextStyle(color: theme.darkForeground),
    //           ),
    //           onChanged:
    //               (TelopDisplayMode? value) =>
    //                   _onTelopDisplayModeRadioChanged(value, ref),
    //         );
    //       }).toList(),
    // );
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
