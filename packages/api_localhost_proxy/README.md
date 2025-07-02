# Api Localhost Proxy

## Overview

A Flutter package that API localhost proxy server.

## Usage

### Add the Package

Using command:
```bash
dart pub add configure --git https://github.com/YDITS/YDITS-SSC.git --path packages/api_local_server --ref master
```

@/pubspec.yaml:
```yaml
dependencies:
  configure:
    git:
      url: https://github.com/YDITS/YDITS-SSC.git
      path: packages/api_local_server
      ref: master
```

### Get the Dependencies

```bash
dart pub get
```

### Use App Configure

A sample code:
```dart
import "package:api_localhost_proxy/api_localhost_proxy.dart";

final ApiProxy apiProxy = ApiProxy(port: 9000);
final port = apiProxy.startServer();
```

## Development

### Get the Dependencies

```bash
dart pub get
```

## License

Licensed under the [MIT LICENSE](./LICENSE).

Copyright &copy; よね/Yone
