import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocProvider;
import 'package:hive_flutter/hive_flutter.dart';

import 'core/constants/constants_platform.dart';
import 'core/themes/app_theme.dart';
import 'features/fuel/data/datasources/fuel_local_data_source.dart';
import 'features/fuel/data/repositories/fuel_repository_impl.dart';
import 'features/fuel/domain/entities/fuel.dart';
import 'features/fuel/domain/usecases/add_fuel.dart';
import 'features/fuel/domain/usecases/get_all_fuels.dart';
import 'features/fuel/presentation/blocs/bloc/fuel_bloc.dart';
import 'features/fuel/presentation/pages/fuel_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // initialize Hive
  await Hive.initFlutter();

  // Register the FuelLog adapter
  // Todo handle exception
  Hive.registerAdapter(FuelAdapter());

  // Open the boc for fuel logs
  final Box<Fuel> fuelBox = await Hive.openBox<Fuel>('fuel_logs');

  runApp(LowFuelAlertApp(fuelBox));
}

class LowFuelAlertApp extends StatelessWidget {
  final Box<Fuel> fuelBox;
  const LowFuelAlertApp(this.fuelBox, {super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FuelBloc(
        addFuel: AddFuel(FuelRepositoryImpl(FuelLocalDataSourceImp(fuelBox))),
        getAllFuels: GetAllFuels(FuelRepositoryImpl(FuelLocalDataSourceImp(fuelBox))),
      )..add(GetAllFuelsEvent()),
      child: MaterialApp(
        title: ConstantsPlatform.appName,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.system,
        home: FuelPage(),
      ),
    );
  }
}
