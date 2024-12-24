import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:low_fuel_alert/features/fuel/domain/entities/fuel.dart';
import 'package:low_fuel_alert/features/fuel/presentation/blocs/bloc/fuel_bloc.dart';
import 'package:low_fuel_alert/features/fuel/presentation/pages/fuel_page.dart';

void main() {
  testWidgets('FuelPage should display "No fuel yet" when no logs exist',
      (WidgetTester tester) async {
    final Fuel mockFuelLog = Fuel(date: DateTime(2024, 12, 18), amount: 100.0);
    final mockFuelBloc = FuelBloc()..add(AddFuelEvent(mockFuelLog));

    await tester.pumpWidget(MaterialApp(
      home: BlocProvider<FuelBloc>(
        create: (_) => mockFuelBloc,
        child: const FuelPage(),
      ),
    ));

    expect(find.text('No logs yet'), findsOneWidget);
  });

  testWidgets('FuelPage should display list of fuels logs data is available', (WidgetTester tester) async {
    final Fuel mockFuelLog = Fuel(date: DateTime(2024, 12, 18), amount: 100.0);
    final FuelBloc mockFuelBloc = FuelBloc()..emit(FuelSuccessState([mockFuelLog]));

    await tester.pumpWidget(MaterialApp(
      home: BlocProvider<FuelBloc>(
        create: (_) => mockFuelBloc,
        child: FuelPage(),
      ),
    ));

    expect(find.text('100'), findsOneWidget);
  });
}
