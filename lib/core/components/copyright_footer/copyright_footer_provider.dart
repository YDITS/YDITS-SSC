//
// YDITS for SSC
//
// Copyright (C) よね/Yone
//
// https://github.com/YDITS/YDITS-SSC
//

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ydits_ssc/core/components/copyright_footer/copyright_footer.dart';

final Provider<CopyrightFooter> copyrightFooterProvider = Provider(
  (ref) => const CopyrightFooter(),
);
