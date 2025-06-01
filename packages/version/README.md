# Version

## Overview

A Dart package that version management system.

## Usage

### Add the Package

Using command:
```bash
dart pub add version --git https://github.com/YDITS/YDITS-SSC.git --path packages/version --ref master
```

@/pubspec.yaml:
```yaml
dependencies:
  version:
    git:
      url: https://github.com/YDITS/YDITS-SSC.git
        path: packages/version
        ref: master
```

### Get the Dependencies

```bash
dart pub get
```

### Use

A sample code:
```dart
import "package:version/version.dart";

final Version version = Version(
    major: 1,
    minor: 0,
    patch: 0,
    level: VersionLevels.develop
);

print(version.string); // => "1.0.0 (develop)"
```

## Development

### Get the Dependencies

```bash
dart pub get
```

## License

Licensed under the [MIT LICENSE](./LICENSE).

Copyright &copy; よね/Yone
