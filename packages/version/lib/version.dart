//
// Version
//
// Copyright (C) よね/Yone
//
// Licensed under the MIT License.
//
// https://github.com/YDITS/YDITS-SSC/blob/master/packages/version
//

class Version {
  Version({
    required this.major,
    required this.minor,
    required this.patch,
    required this.level,
  });

  int major;
  int minor;
  int patch;
  VersionLevels level;

  static Map<VersionLevels, String> versionLevelTexts = {
    VersionLevels.stable: "",
    VersionLevels.beta: "Beta",
    VersionLevels.develop: "Develop"
  };

  String get string {
    String version = "$major.$minor.$patch";
    if (level == VersionLevels.stable) return version;
    String levelText = versionLevelTexts[level] ?? "";
    return "$version ($levelText)";
  }
}

enum VersionLevels {
  stable,
  beta,
  develop,
}
