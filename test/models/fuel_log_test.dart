import 'package:flutter_test/flutter_test.dart';
import 'package:low_fuel_alert/features/fuel/domain/entities/fuel_log.dart';

void main() {
  group('FuelLog', () {
    test('should correctly initialize FuelLog properties', () {
      final FuelLog fuelLog = FuelLog(
        date: DateTime(2024, 12, 20),
        fuelAdded: 15.0,
      );

      expect(fuelLog.date, DateTime(2024, 12, 20));
      expect(fuelLog.fuelAdded, 15.0);
    });
  });
}
