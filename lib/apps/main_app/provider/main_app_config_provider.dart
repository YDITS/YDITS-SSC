//
// YDITS for SSC
//
// Copyright (C) よね/Yone
//
// https://github.com/YDITS/YDITS-SSC
//

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ydits_ssc/apps/main_app/model/main_app_config.dart';
import 'package:ydits_ssc/apps/main_app/model/main_app_window_config.dart';

part 'main_app_config_provider.g.dart';

@riverpod
YditsSscAppConfig yditsSscAppConfig(_) => YditsSscAppConfig();

@riverpod
YditsSscWindowConfig yditsSscWindowConfig(_) => YditsSscWindowConfig();
