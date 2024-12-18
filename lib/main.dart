import 'package:flutter/material.dart';
import 'core/constants/platform_constants.dart';
import 'core/themes/app_theme.dart';

void main() {
  runApp(const LowFuelAlertApp());
}

class LowFuelAlertApp extends StatelessWidget {
  const LowFuelAlertApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: PlatformConstants.appName,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: PlatformConstants.isDesktop
          ? const DesktopHomePage()
          : const MobileHomePage(),
    );
  }
}

class DesktopHomePage extends StatelessWidget {
  const DesktopHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('LowFuelAlert - Desktop')),
      body: const Center(child: Text('Welcome to the Desktop Version')),
    );
  }
}

class MobileHomePage extends StatelessWidget {
  const MobileHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('LowFuelAlert - Mobile')),
      body: const Center(child: Text('Welcome to the Mobile Version')),
    );
  }
}