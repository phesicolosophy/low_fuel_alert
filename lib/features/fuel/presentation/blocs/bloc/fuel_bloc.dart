import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:low_fuel_alert/features/fuel/domain/entities/fuel.dart';
import 'package:meta/meta.dart';

part 'fuel_event.dart';
part 'fuel_state.dart';

final Box<Fuel> _fuelBox = Hive.box<Fuel>('fuel_logs');

class FuelBloc extends Bloc<FuelEvent, FuelState> {

  FuelBloc() : super(FuelInitialState(_fuelBox)) {
    on<AddFuelEvent>((event, emit) {
      _fuelBox.add(event.log);
      emit.call(FuelSuccessState(_fuelBox.values.toList()));
    });
  }
}
