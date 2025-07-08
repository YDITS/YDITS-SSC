//
// YDITS for SSC
//
// Copyright (C) よね/Yone
//
// https://github.com/YDITS/YDITS-SSC
//

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'copyright_name_provider.g.dart';

/// A provider that returns the copyright holder's name.
@riverpod
String copyrightName(Ref ref) => 'よね/Yone';
