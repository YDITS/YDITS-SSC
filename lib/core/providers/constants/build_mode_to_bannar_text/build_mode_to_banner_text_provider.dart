//
// YDITS for SSC
//
// Copyright (C) よね/Yone
//
// https://github.com/YDITS/YDITS-SSC
//

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:version/version.dart';

part 'build_mode_to_banner_text_provider.g.dart';

@riverpod
Map<VersionLevels, String> buildModeToBannarText(_) => <VersionLevels, String>{
  VersionLevels.stable: "STABLE",
  VersionLevels.beta: "BETA",
  VersionLevels.develop: "DEV",
};
