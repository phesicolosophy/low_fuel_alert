part of 'fuel_bloc.dart';

@immutable
sealed class FuelState {}

final class FuelInitial extends FuelState {
  @override
  bool operator ==(Object other) {
    return other is FuelInitial && runtimeType == other.runtimeType;
  }
}

final class FuelSuccess extends FuelState {
  final List<FuelLog> logs;

  FuelSuccess(this.logs);

  @override
  bool operator ==(Object other) {
    return other is FuelSuccess &&  super.runtimeType == other.runtimeType;
  }

  @override
  int get hashCode => logs.hashCode;
  
}
