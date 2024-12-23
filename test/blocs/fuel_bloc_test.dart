import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mockito/mockito.dart';
import 'package:low_fuel_alert/features/fuel/domain/entities/fuel_log.dart';
import 'package:low_fuel_alert/features/fuel/domain/usecases/add_fuel_log.dart';
import 'package:low_fuel_alert/features/fuel/presentation/blocs/bloc/fuel_bloc.dart';


class MockHiveBox extends Mock implements Box<FuelLog>{}

void main() {
  late FuelBloc fuelBloc;

  late MockHiveBox mockBox;

  setUp(() async {
    fuelBloc = FuelBloc();
    mockBox = MockHiveBox();
  });

  tearDown(() {
    fuelBloc.close();
  });

  test('initial state should be FuelInitial', () {
    expect(fuelBloc.state, equals(FuelInitial(mockBox)));
  });

  test('should emit FuelSuccess when logs are added', () {
    final FuelLog fuelLog = FuelLog(
      date: DateTime(2024, 12, 20),
      amount: 200.0,
    );

    expectLater(
      fuelBloc.stream,
      emitsInOrder([
        FuelSuccess([fuelLog])
      ]),
    );

    fuelBloc.add(AddFuel(fuelLog));
  });

  group('Hive persistence', () {
    test('should add a fuel log and persist it', () {
      final fuelLog = FuelLog(
        date: DateTime.now(),
        amount: 300.0,
      );

      when(mockBox.add(fuelLog)).thenAnswer((_) => Future(() => 1));

      mockBox.add(fuelLog);

      verify(mockBox.add(fuelLog)).called(1);
    });
  });
}
