//
// YDITS for SSC
//
// Copyright (C) よね/Yone
//
// https://github.com/YDITS/YDITS-SSC
//

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ydits_ssc/main_app/configure/main_app_config.dart';

part 'main_app_config_provider.g.dart';

@riverpod
YditsSscAppConfig yditsSscAppConfig(Ref ref) => YditsSscAppConfig();
