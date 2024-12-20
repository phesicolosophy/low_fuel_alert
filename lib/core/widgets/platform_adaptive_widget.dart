import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

/// PlatformAdaptiveWidget: Displays different UI components based on platform.
/// - Desktop: Uses wide layouts and padding.
/// - Mobile: Uses compact layouts.
class PlatformAdaptiveWidget extends StatelessWidget {
  final Widget mobileChild;
  final Widget desktopChild;

  const PlatformAdaptiveWidget({
    required this.mobileChild,
    required this.desktopChild,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (kIsWeb || (defaultTargetPlatform == TargetPlatform.windows || defaultTargetPlatform == TargetPlatform.linux)) {
      return desktopChild;
    } else {
      return mobileChild;
    }
  }
}