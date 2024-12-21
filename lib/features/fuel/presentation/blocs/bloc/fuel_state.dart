part of 'fuel_bloc.dart';

@immutable
sealed class FuelState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class FuelInitial extends FuelState {}

final class FuelSuccess extends FuelState {
  final List<FuelLog> logs;

  FuelSuccess(this.logs);
  
  @override
  List<Object?> get props => [logs];
}
