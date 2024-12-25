import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart' show Equatable;
import 'package:meta/meta.dart' show immutable;

import '../../../../../core/usercase/usecase.dart' show NoParams;
import '../../../domain/entities/fuel.dart';
import '../../../domain/usecases/add_fuel.dart';
import '../../../domain/usecases/get_all_fuels.dart';

part 'fuel_event.dart';
part 'fuel_state.dart';

class FuelBloc extends Bloc<FuelEvent, FuelState> {
  final AddFuel _addFuel;
  final GetAllFuels _getAllFuels;

  FuelBloc({
    required AddFuel addFuel,
    required GetAllFuels getAllFuels,
  })  : _addFuel = addFuel,
        _getAllFuels = getAllFuels,
        super(FuelInitialState()) {
    on<FuelEvent>((event, emit) => emit(FuelLoadingState()));
    on<AddFuelEvent>(_onAddFuelEvent);
    on<GetAllFuelsEvent>(_onGetAllFuelsEvent);
  }

  void _onAddFuelEvent(AddFuelEvent event, Emitter<FuelState> emit) async {
    final res = await _addFuel(AddFuelParams(fuelLog: event.log));

    res.fold(
      (l) => emit(FuelFailureState(l.message)),
      (r) => emit(FuelSuccessState(r.values.toList())),
    );
  }

  void _onGetAllFuelsEvent(GetAllFuelsEvent event, Emitter<FuelState> emit) async {
    final res = await _getAllFuels(NoParams());

    res.fold(
      (l) => emit(FuelFailureState(l.message)),
      (r) => emit(FuelSuccessState(r.values.toList())),
    );
  }
}
