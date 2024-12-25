
import 'package:fpdart/fpdart.dart';
import 'package:low_fuel_alert/core/errors/failures.dart';

abstract interface class Usecase<Success, Params> {
  Future<Either<Failure, Success>> call(Params params);
}

class NoParams {}
