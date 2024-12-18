
import '../entities/fuel_log.dart';

class AddFuelLog {
  final List<FuelLog> _fuelLogs = [];

  void call(FuelLog fuelLog) {
    _fuelLogs.add(fuelLog);
  }

  List<FuelLog> getAllLogs() => _fuelLogs;
}