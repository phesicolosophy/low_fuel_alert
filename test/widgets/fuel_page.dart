import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:low_fuel_alert/features/fuel/domain/entities/fuel_log.dart';
import 'package:low_fuel_alert/features/fuel/domain/usecases/add_fuel_log.dart';
import 'package:low_fuel_alert/features/fuel/presentation/blocs/bloc/fuel_bloc.dart';
import 'package:low_fuel_alert/features/fuel/presentation/pages/fuel_page.dart';

void main() {
  testWidgets('FuelPage should display "No logs yet" when no logs exist',
      (WidgetTester tester) async {
    final FuelLog mockFuelLog = FuelLog(date: DateTime(2024, 12, 18), fuelAdded: 10.0);
    final mockFuelBloc = FuelBloc(AddFuelLog())..add(AddFuel(mockFuelLog));

    await tester.pumpWidget(MaterialApp(
      home: BlocProvider<FuelBloc>(
        create: (_) => mockFuelBloc,
        child: const FuelPage(),
      ),
    ));

    expect(find.text('No logs yet'), findsOneWidget);
  });

  testWidgets('FuelPage should display list of log data is available', (WidgetTester tester) async {
    final FuelLog mockFuelLog = FuelLog(date: DateTime(2024, 12, 18), fuelAdded: 10.0);
    final FuelBloc mockFuelBloc = FuelBloc(AddFuelLog())..emit(FuelSuccess([mockFuelLog]));

    await tester.pumpWidget(MaterialApp(
      home: BlocProvider<FuelBloc>(
        create: (_) => mockFuelBloc,
        child: FuelPage(),
      ),
    ));

    expect(find.text('10'), findsOneWidget);
  });
}
