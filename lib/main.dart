import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocProvider;
import 'package:low_fuel_alert/features/fuel/domain/usecases/add_fuel_log.dart';
import 'package:low_fuel_alert/features/fuel/presentation/pages/fuel_page.dart';
import 'core/constants/platform_constants.dart';
import 'core/themes/app_theme.dart';
import 'features/fuel/presentation/blocs/bloc/fuel_bloc.dart';

void main() {
  runApp(const LowFuelAlertApp());
}

class LowFuelAlertApp extends StatelessWidget {
  const LowFuelAlertApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FuelBloc(AddFuelLog()),
      child: MaterialApp(
        title: PlatformConstants.appName,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.system,
        home: PlatformConstants.isDesktop ? const DesktopHomePage() : const MobileHomePage(),
      ),
    );
  }
}

class DesktopHomePage extends StatelessWidget {
  const DesktopHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('LowFuelAlert - Desktop')),
      body: Column(
        children: [
          Text('Welcome to the Desktop Version'),
          Expanded(child: FuelPage()),
        ],
      ),
    );
  }
}

class MobileHomePage extends StatelessWidget {
  const MobileHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('LowFuelAlert - Mobile')),
      body: Column(
        children: [
          Text('Welcome to the Mobile Version'),
          Expanded(
            child: FuelPage(),
          )
        ],
      ),
    );
  }
}
