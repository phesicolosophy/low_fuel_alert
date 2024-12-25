part of 'fuel_bloc.dart';

@immutable
sealed class FuelState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class FuelInitialState extends FuelState {}

final class FuelSuccessState extends FuelState {
  final List<Fuel> logs;

  FuelSuccessState(this.logs);
  
  @override
  List<Object?> get props => [logs];
}

class FuelLoadingState extends FuelState {}

final class FuelFailureState extends FuelState {
  final String message;

  FuelFailureState(this.message);
}
