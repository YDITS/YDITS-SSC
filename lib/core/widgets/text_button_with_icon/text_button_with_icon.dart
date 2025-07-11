//
// YDITS for SSC
//
// Copyright (C) よね/Yone
//
// https://github.com/YDITS/YDITS-SSC
//

import 'package:flutter/material.dart';

/// A custom text button that includes an icon.
class TextButtonWithIcon extends StatelessWidget {
  const TextButtonWithIcon({
    required this.iconData,
    required this.child,
    required this.onPressed,
    super.key,
  });

  /// The icon to be displayed.
  final IconData iconData;

  /// The widget to be displayed below the icon.
  final Widget child;

  /// The callback that is called when the button is pressed.
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: IconButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        backgroundColor: Colors.blueGrey[900],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            Icon(iconData, size: 64),
            const SizedBox(height: 16),
            Center(child: child),
          ],
        ),
      ),
    );
  }
}
