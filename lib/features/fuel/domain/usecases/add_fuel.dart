
import 'package:fpdart/src/either.dart';
import 'package:hive/hive.dart' show Box;

import '../../../../core/errors/failures.dart';
import '../../../../core/usercase/usecase.dart' show Usecase;
import '../entities/fuel.dart' show Fuel;
import '../repositories/fuel_repository.dart';

class AddFuel implements Usecase<Box<Fuel>, AddFuelParams> {
  FuelRepository fuelRepository;
  AddFuel(this.fuelRepository);


  @override
  Future<Either<Failure, Box<Fuel>>> call(AddFuelParams params) {
    return fuelRepository.addFuel(params.fuelLog);
  }
  
}

class AddFuelParams {
  final Fuel fuelLog;

  AddFuelParams({required this.fuelLog});
}
