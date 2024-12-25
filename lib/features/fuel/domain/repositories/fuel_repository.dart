
import 'package:fpdart/fpdart.dart';
import 'package:hive/hive.dart';

import '../../../../core/errors/failures.dart';
import '../entities/fuel.dart' show Fuel;

abstract interface class FuelRepository {
  Future<Either<Failure, Box<Fuel>>> addFuel(Fuel fuelLog);
}