# Configure

## Overview

A Dart package that config management system.

## Usage

### Add the Package

Using command:
```bash
dart pub add configure --git https://github.com/YDITS/YDITS-SSC.git --path packages/configure --ref master
```

@/pubspec.yaml:
```yaml
dependencies:
  configure:
    git:
      url: https://github.com/YDITS/YDITS-SSC.git
      path: packages/configure
      ref: master
```

### Get the Dependencies

```bash
dart pub get
```

### Use App Configure

A sample code:
```dart
import "package:configure/configure.dart";
import "package:version/version.dart";

final AppConfig myAppConfig = AppConfig(
    title: "My Application",
    description: "The my application",
    version: Version(major: 1, minor: 0, patch: 0, level: VersionLevels.develop);
);
```

or as implements:
```dart
import "package:configure/configure.dart";
import "package:version/version.dart";

class MyAppConfig implements AppConfig {
  @override
  final String title = "My Application";

  @override
  final String description = "The my application.";

  @override
  final Version version =
      Version(major: 1, minor: 0, patch: 0, level: VersionLevels.develop);
}

final AppConfig myAppConfig = MyAppConfig();
```

### Use Window Configure

A sample code:
```dart
import "package:configure/configure.dart";
import "package:version/version.dart";

final WindowConfig myWindowConfig = WindowConfig(
    title: "My Window",
    frame: const Rect.fromLTWH(128, 128, 960, 540),
    minSize: const Size(640, 360),
    maxSize: Size.infinite,
);
```

or as implements:
```dart
import "package:configure/configure.dart";
import "package:version/version.dart";

class MyWindowConfig implements WindowConfig {
  @override
  final String title = "My Window";

  @override
  final Rect frame = const Rect.fromLTWH(128, 128, 960, 540);

  @override
  final Size minSize = const Size(640, 360);

  @override
  final Size maxSize = Size.infinite;
}

final WindowConfig myWindowConfig = MyWindowConfig();
```

## Development

### Get the Dependencies

```bash
dart pub get
```

## License

Licensed under the [MIT LICENSE](./LICENSE).

Copyright &copy; よね/Yone
