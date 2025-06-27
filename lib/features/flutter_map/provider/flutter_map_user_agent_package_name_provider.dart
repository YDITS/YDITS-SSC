//
// YDITS for SSC
//
// Copyright (C) よね/Yone
//
// https://github.com/YDITS/YDITS-SSC
//

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'flutter_map_user_agent_package_name_provider.g.dart';

@riverpod
String flutterMapUserAgentPackageName(Ref ref) => "com.yoneyo.tests.ydits-ssc";
