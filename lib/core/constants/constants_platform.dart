import 'dart:io';

class ConstantsPlatform {
  ConstantsPlatform._();
  static final bool isDesktop = Platform.isWindows || Platform.isLinux;
  static final bool isMobile = Platform.isAndroid;

  static const appName = 'LowFuelAlert';
}