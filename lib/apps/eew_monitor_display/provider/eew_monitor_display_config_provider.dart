//
// YDITS for SSC
//
// Copyright (C) よね/Yone
//
// https://github.com/YDITS/YDITS-SSC
//

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ydits_ssc/apps/eew_monitor_display/model/eew_monitor_display_config.dart';

part 'eew_monitor_display_config_provider.g.dart';

@riverpod
EEWMonitorDisplayAppConfig eewMonitorDisplayAppConfig(_) => EEWMonitorDisplayAppConfig();

@riverpod
EEWMonitorDisplayWindowConfig eewMonitorDisplayWindowConfig(_) => EEWMonitorDisplayWindowConfig();
