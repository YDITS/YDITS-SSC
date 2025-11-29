//
// YDITS for SSC
//
// Copyright (C) よね/Yone
//
// https://github.com/YDITS/YDITS-SSC
//

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'flutter_secure_storage_provider.g.dart';

/// A provider that exposes an instance of [FlutterSecureStorage].
@riverpod
FlutterSecureStorage storage(Ref ref) => const FlutterSecureStorage();
