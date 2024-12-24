
import '../entities/fuel.dart';

class AddFuel {
  final List<Fuel> _fuelLogs = [];

  void call(Fuel fuel) {
    _fuelLogs.add(fuel);
  }

  List<Fuel> getAllLogs() => _fuelLogs;
}