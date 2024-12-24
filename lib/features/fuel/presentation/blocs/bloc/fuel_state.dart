part of 'fuel_bloc.dart';

@immutable
sealed class FuelState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class FuelInitialState extends FuelState {
  final Box<Fuel> logsBox;

  FuelInitialState(this.logsBox);

  // @override
  // List<Object?> get props => [logsBox];
}

final class FuelSuccessState extends FuelState {
  final List<Fuel> logs;

  FuelSuccessState(this.logs);
  
  @override
  List<Object?> get props => [logs];
}
