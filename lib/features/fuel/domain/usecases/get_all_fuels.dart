import 'package:fpdart/fpdart.dart';
import 'package:hive/hive.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usercase/usecase.dart';
import '../entities/fuel.dart';
import '../repositories/fuel_repository.dart';

class GetAllFuels implements Usecase<Box<Fuel>, NoParams> {

  final FuelRepository fuelRepository;
  GetAllFuels(this.fuelRepository);

  @override
  Future<Either<Failure, Box<Fuel>>> call(NoParams params) {
    return fuelRepository.getAllFuels();
  }
}
