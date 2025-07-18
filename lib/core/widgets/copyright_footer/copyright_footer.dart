//
// YDITS for SSC
//
// Copyright (C) よね/Yone
//
// https://github.com/YDITS/YDITS-SSC
//

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ydits_ssc/core/providers/constants/copyright_name/copyright_name_provider.dart';

/// A widget that displays a copyright footer.
class CopyrightFooter extends ConsumerWidget {
  const CopyrightFooter({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String name = ref.watch(copyrightNameProvider);

    return Container(
      color: Colors.black87,
      padding: const EdgeInsets.all(12),
      child: Center(
        child: Text(
          'Copyright © $name',
          style: const TextStyle(fontSize: 12, color: Colors.white),
        ),
      ),
    );
  }
}
