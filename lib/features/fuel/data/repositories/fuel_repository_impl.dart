import 'package:hive_flutter/hive_flutter.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/entities/fuel.dart';
import '../../domain/repositories/fuel_repository.dart';
import '../datasources/fuel_local_data_source.dart' show FuelLocalDataSource;

class FuelRepositoryImpl implements FuelRepository {
  final FuelLocalDataSource fuelLocalDataSource;

  FuelRepositoryImpl(this.fuelLocalDataSource);

  @override
  Future<Either<Failure, Box<Fuel>>> addFuel(Fuel fuelLog) async {
    try {
      final Box<Fuel> fuelBox = fuelLocalDataSource.addFuel(fuelLog);
      return right(fuelBox);
    } on ExceptionLocalData catch (e) {
      return left(Failure(e.message));
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Box<Fuel>>> getAllFuels() async {
    try {
      final Box<Fuel> fuelBox = fuelLocalDataSource.getAllFuels();
      return right(fuelBox);
    } on ExceptionLocalData catch (e) {
      return left(Failure(e.message));
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }
}
