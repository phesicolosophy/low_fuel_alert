
import 'package:low_fuel_alert/features/fuel/domain/entities/fuel_log.dart';

void main() {
  final List<FuelLog> mockFuelLogs = [
    FuelLog(date: DateTime(2024, 12, 18), fuelAdded: 10.0),
    FuelLog(date: DateTime(2024, 12, 19), fuelAdded: 20.0),
  ];
}