
import 'package:hive/hive.dart';

import '../../../../core/constants/constants_errors.dart';
import '../../../../core/errors/exceptions.dart';
import '../../domain/entities/fuel.dart';

abstract interface class FuelLocalDataSource {
  Box<Fuel> addFuel(Fuel fuelLog);
}

class FuelLocalDataSourceImp implements FuelLocalDataSource {
  final Box<Fuel> fuelBox;

  FuelLocalDataSourceImp(this.fuelBox);

  @override
  Box<Fuel> addFuel(Fuel fuelLog) {
    if (fuelBox.isOpen) {
      fuelBox.add(fuelLog);
      return fuelBox;
    }
    throw ExceptionLocalData(ConstantsErrors.databaseClose);
  }
}