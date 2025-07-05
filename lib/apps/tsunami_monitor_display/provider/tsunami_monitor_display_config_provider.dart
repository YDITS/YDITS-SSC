//
// YDITS for SSC
//
// Copyright (C) よね/Yone
//
// https://github.com/YDITS/YDITS-SSC
//

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ydits_ssc/apps/tsunami_monitor_display/model/tsunami_monitor_display_config.dart';

part 'tsunami_monitor_display_config_provider.g.dart';

@riverpod
TsunamiMonitorDisplayAppConfig tsunamiMonitorDisplayAppConfig(_) => TsunamiMonitorDisplayAppConfig();

@riverpod
TsunamiMonitorDisplayWindowConfig tsunamiMonitorDisplayWindowConfig(_) => TsunamiMonitorDisplayWindowConfig();
