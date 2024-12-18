part of 'fuel_bloc.dart';

@immutable
sealed class FuelState {}

final class FuelInitial extends FuelState {}

final class FuelSuccess extends FuelState {
  final List<FuelLog> logs;

  FuelSuccess(this.logs);
}
