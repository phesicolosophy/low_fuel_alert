
import '../../domain/entities/fuel.dart';

class FuelModel extends Fuel {

  FuelModel({
    required super.date,
    required super.amount,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'date': date,
      'amount': amount,
    };
  }

  factory FuelModel.fromJson(Map<String, dynamic> map) {
    return FuelModel(
      date: map['date'] as DateTime,
      amount: map['amount'] as double,
    );
  }

  @override
  String toString() {
    return 'Fuel(date: $date, amount: $amount, fuelCost: $fuelCost, '
        'fuelAdded: $fuelAdded, estimatedDistance: $estimatedDistance)';
  }
}
