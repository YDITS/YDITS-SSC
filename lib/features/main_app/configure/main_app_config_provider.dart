//
// YDITS for SSC
//
// Copyright (C) よね/Yone
//
// https://github.com/YDITS/YDITS-SSC
//

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ydits_ssc/features/main_app/configure/main_app_config.dart';

final Provider<YditsSscAppConfig> yditsSscMainAppConfigProvider = Provider(
  (ref) => YditsSscAppConfig(),
);
