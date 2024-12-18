import 'package:bloc/bloc.dart';
import 'package:low_fuel_alert/features/fuel/domain/entities/fuel_log.dart';
import 'package:low_fuel_alert/features/fuel/domain/usecases/add_fuel_log.dart';
import 'package:meta/meta.dart';

part 'fuel_event.dart';
part 'fuel_state.dart';

class FuelBloc extends Bloc<FuelEvent, FuelState> {
  final AddFuelLog addFuelLog;
  FuelBloc(this.addFuelLog) : super(FuelInitial()) {
    on<AddFuel>((event, emit) {
      addFuelLog.call(event.log);    
      emit(FuelSuccess(addFuelLog.getAllLogs()));
    });
  }
}
