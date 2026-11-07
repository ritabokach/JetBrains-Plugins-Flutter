import 'package:flutter/material.dart';

class ContentWidth extends StatelessWidget {
  const ContentWidth({super.key, required this.child});

  static const double maxWidth = 720;

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: maxWidth),
        child: SizedBox(width: double.infinity, child: child),
      ),
    );
  }
}
