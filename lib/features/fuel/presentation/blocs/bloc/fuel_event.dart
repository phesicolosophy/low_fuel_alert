part of 'fuel_bloc.dart';

@immutable
sealed class FuelEvent {}

final class AddFuelEvent extends FuelEvent {
  final Fuel log;

  AddFuelEvent(this.log);
}

class GetAllFuelsEvent extends FuelEvent {}
