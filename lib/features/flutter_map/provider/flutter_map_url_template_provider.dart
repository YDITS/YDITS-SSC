//
// YDITS for SSC
//
// Copyright (C) よね/Yone
//
// https://github.com/YDITS/YDITS-SSC
//

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'flutter_map_url_template_provider.g.dart';

@riverpod
String flutterMapUrlTemplate(Ref ref) => "https://tile.openstreetmap.org/{z}/{x}/{y}.png";
