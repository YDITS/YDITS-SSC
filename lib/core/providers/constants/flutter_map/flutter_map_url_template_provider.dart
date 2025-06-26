//
// YDITS for SSC
//
// Copyright (C) よね/Yone
//
// https://github.com/YDITS/YDITS-SSC
//

import 'package:flutter_riverpod/flutter_riverpod.dart';

final flutterMapUrlTemplateProvider = Provider(
  (ref) => "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
);
