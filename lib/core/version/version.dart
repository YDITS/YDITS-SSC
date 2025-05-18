//
// YDITS for SSC
//
// Copyright (C) よね/Yone
//
// https://github.com/YDITS/YDITS-SSC
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

  String get text {
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
