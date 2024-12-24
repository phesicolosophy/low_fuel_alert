import 'package:flutter_test/flutter_test.dart';
import 'package:low_fuel_alert/features/fuel/domain/entities/fuel.dart';

void main() {
  group('FuelLog', () {
    test('should correctly initialize Fuel properties', () {
      final Fuel fuelLog = Fuel(
        date: DateTime(2024, 12, 20),
        amount: 500.0,
      );

      expect(fuelLog.date, DateTime(2024, 12, 20));
      expect(fuelLog.amount, 500.0);
    });

    test('should calculate fuelAdded and estimatedDistance correctly', () {
  final fuelLog = Fuel(
    date: DateTime(2024, 12, 20),
    amount: 500.0,
  );

  expect(fuelLog.fuelAdded, 47.61904761904762); // 500.0 ÷ 10.5 = 47.62 litres
  expect(fuelLog.estimatedDistance, 5000.0); // 47.62 × 105.0 = 5000.0 m -> 5 km
});
  });
}
