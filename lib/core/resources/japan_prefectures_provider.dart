//
// YDITS for SSC
//
// Copyright (C) よね/Yone
//
// https://github.com/YDITS/YDITS-SSC
//

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ydits_ssc/core/resources/japan_prefectures.dart';

final Provider<Type> japanPrefecturesProvider = Provider(
  (ref) => JapanPrefectures,
);
