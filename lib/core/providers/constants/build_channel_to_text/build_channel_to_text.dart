//
// YDITS for SSC
//
// Copyright (C) よね/Yone
//
// https://github.com/YDITS/YDITS-SSC
//

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:version/version.dart';

part 'build_channel_to_text.g.dart';

@riverpod
Map<VersionLevels, String> buildChannelToText(_) => {
  VersionLevels.stable: "Stable",
  VersionLevels.beta: "Beta",
  VersionLevels.develop: "Develop",
};
