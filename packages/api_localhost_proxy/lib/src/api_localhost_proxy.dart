//
// Api Localhost Proxy
//
// Copyright (C) よね/Yone
//
// Licensed under the MIT License.
//
// https://github.com/YDITS/YDITS-SSC/blob/master/packages/api_localhost_proxy
//

import 'dart:io';
import 'dart:typed_data';
import 'package:logging/logging.dart';

final class ApiProxy {
  ApiProxy({ required this.port });

  late final Logger logger;
  final int port;
  ServerSocket? server;
  void Function(dynamic data)? onData;

  Future<void> startServer() async {
    server = await ServerSocket.bind(InternetAddress.loopbackIPv4, port);

    if (server == null) {
      return;
    }

    await for (Socket client in server as ServerSocket) {
      client.listen(
        (Uint8List data) => _onData(data),
        onDone: () => _onDone(),
        onError: (error) => _onError(error),
      );
    }
  }

  void _onData(Uint8List data) {
    final message = String.fromCharCodes(data);
    logger.info(message);
  }

  void _onDone() {}

  void _onError(error) {}

  Future<void> sendToAllClients(Object? message) async {
    await for (Socket client in server as ServerSocket) {
      client.write(message);
    }
  }

  void initializeLogger() {
    logger = Logger('api_localhost_proxy');
    Logger.root.level = Level.ALL;
    Logger.root.onRecord.listen((record) {
      print('${record.level.name}: ${record.time}: ${record.message}');
    });
  }
}
