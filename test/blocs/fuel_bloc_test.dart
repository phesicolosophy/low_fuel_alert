import 'package:flutter_test/flutter_test.dart';
import 'package:low_fuel_alert/features/fuel/domain/entities/fuel_log.dart';
import 'package:low_fuel_alert/features/fuel/domain/usecases/add_fuel_log.dart';
import 'package:low_fuel_alert/features/fuel/presentation/blocs/bloc/fuel_bloc.dart';

void main() {
  late FuelBloc fuelBloc;

  setUp(() {
    fuelBloc = FuelBloc(AddFuelLog());
  });

  tearDown(() {
    fuelBloc.close();
  });

  test('initial state should be FuelInitial', () {
    // TODO FixMe: when running
    // expect(fuelBloc.state, equals(FuelInitial()));
    // Expected: <Instance of 'FuelInitial'>
    // Actual: <Instance of 'FuelInitial'>
    //package:matcher
    expect(fuelBloc.state is FuelInitial, true);
  });

// TODO FixMe: TimeOut
  test('should emit FuelSuccess when logs are added', () {
    final FuelLog fuelLog = FuelLog(
      date: DateTime(2024, 12, 20),
      fuelAdded: 15.0,
    );

    expectLater(
      fuelBloc.stream,
      emitsInOrder([
        FuelSuccess([fuelLog])
      ]),
    );
  });
}
