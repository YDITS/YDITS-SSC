//
// YDITS for SSC
//
// Copyright (C) よね/Yone
//
// https://github.com/YDITS/YDITS-SSC
//

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ydits_ssc/core/providers/theme/model/theme_model.dart';

part 'theme_notifier.g.dart';

/// A notifier for managing the theme mode in the application.
@riverpod
class Theme extends _$Theme {
  @override
  ThemeModel build() => ThemeModel();
}
