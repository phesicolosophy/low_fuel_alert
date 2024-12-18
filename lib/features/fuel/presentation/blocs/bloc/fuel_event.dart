part of 'fuel_bloc.dart';

@immutable
sealed class FuelEvent {}

final class AddFuel extends FuelEvent {
  final FuelLog log;

  AddFuel(this.log);
}
