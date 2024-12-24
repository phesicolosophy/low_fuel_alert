import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocProvider;
import 'package:hive_flutter/hive_flutter.dart';
import 'package:low_fuel_alert/features/fuel/domain/entities/fuel.dart';
import 'package:low_fuel_alert/features/fuel/presentation/pages/fuel_page.dart';
import 'core/constants/platform_constants.dart';
import 'core/themes/app_theme.dart';
import 'features/fuel/presentation/blocs/bloc/fuel_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // initialize Hive
  await Hive.initFlutter();

  // Register the FuelLog adapter
  // Todo handle exception
  Hive.registerAdapter(FuelAdapter());

  // Open the boc for fuel logs
  await Hive.openBox<Fuel>('fuel_logs');

  runApp(const LowFuelAlertApp());
}

class LowFuelAlertApp extends StatelessWidget {
  const LowFuelAlertApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FuelBloc(),
      child: MaterialApp(
        title: PlatformConstants.appName,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.system,
        home: FuelPage(),
      ),
    );
  }
}
