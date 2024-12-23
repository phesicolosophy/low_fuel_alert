import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:low_fuel_alert/features/fuel/domain/entities/fuel_log.dart';
import 'package:low_fuel_alert/features/fuel/domain/usecases/add_fuel_log.dart';
import 'package:meta/meta.dart';

part 'fuel_event.dart';
part 'fuel_state.dart';

final Box<FuelLog> _fuelLogsBox = Hive.box<FuelLog>('fuel_logs');

class FuelBloc extends Bloc<FuelEvent, FuelState> {

  FuelBloc() : super(FuelInitial(_fuelLogsBox)) {
    on<AddFuel>((event, emit) {
      _fuelLogsBox.add(event.log);
      emit.call(FuelSuccess(_fuelLogsBox.values.toList()));
    });
  }
}
