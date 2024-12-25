import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart' show Equatable;
import 'package:meta/meta.dart' show immutable;

import '../../../domain/entities/fuel.dart';
import '../../../domain/usecases/add_fuel.dart';

part 'fuel_event.dart';
part 'fuel_state.dart';

class FuelBloc extends Bloc<FuelEvent, FuelState> {
  final AddFuel _addFuel;

  FuelBloc({
    required AddFuel addFuel,
  })  : _addFuel = addFuel,
        super(FuelInitialState()) {
          on<FuelEvent>((event, emit) => emit(FuelLoadingState()));
    on<AddFuelEvent>(_onAddFuelEvent);
  }

  void _onAddFuelEvent(AddFuelEvent event, Emitter<FuelState> emit) async {
    final res = await _addFuel(AddFuelParams(fuelLog: event.log));

    res.fold(
      (l) => emit(FuelFailureState(l.message)),
      (r) => emit(FuelSuccessState(r.values.toList())),
    );
  }
}
