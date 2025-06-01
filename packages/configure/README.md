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

### Use

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

## Development

### Get the Dependencies

```bash
dart pub get
```

## License

Licensed under the [MIT LICENSE](./LICENSE).

Copyright &copy; よね/Yone
