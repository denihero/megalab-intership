import 'dart:ui';

import 'package:flutter/material.dart';

class BlurBackgroundWidget extends StatelessWidget {
  const BlurBackgroundWidget({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 200),
      child: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaY: 2, sigmaX: 2),
          child: Center(
            child: RepaintBoundary(
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}