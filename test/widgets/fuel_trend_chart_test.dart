import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:low_fuel_alert/features/fuel/domain/entities/fuel_log.dart';
import 'package:low_fuel_alert/features/fuel/presentation/widgets/fuel_trend_chart.dart';

void main() {
  testWidgets('FuelTrendChart displays correctly with logs', (WidgetTester tester) async {
    final mockLogs = [
      FuelLog(date: DateTime(2024, 12, 15), amount: 100.0),
      FuelLog(date: DateTime(2024, 12, 16), amount: 150.0),
    ];

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: FuelTrendChart(fuelLogs: mockLogs),
        ),
      ),
    );

    expect(find.text('Fuel Trends'), findsOneWidget);
    expect(find.byType(LineChart), findsOneWidget);
  });
}