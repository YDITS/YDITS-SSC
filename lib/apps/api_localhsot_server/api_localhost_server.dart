//
// YDITS for SSC
//
// Copyright (C) よね/Yone
//
// https://github.com/YDITS/YDITS-SSC
//

import "package:api_localhost_proxy/api_localhost_proxy.dart";

final class ApiLocalhostServer {
  const ApiLocalhostServer();

  void main() {
    final ApiProxy apiProxy = ApiProxy(port: 9000);
    final port = apiProxy.startServer();
  }
}