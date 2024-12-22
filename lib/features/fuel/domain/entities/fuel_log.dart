/// Represents a log entry for fuel tracking.
/// Register the log history etch time you add fuel to tank.
/// 
/// [date] the time that the fuel get added to the tank.
/// 
/// [fuelAdded] is the amount of fuel (unit) get added.
// Todo[DONE] replace fuelAdded by amount of money added, calculate the fuel added by saving a global variable
// todo rate exchange from money to fuel; calculate the same wey to how match in kilometer that amount going to rest
class FuelLog {
  /// The date and time of the fuel log entry.
  final DateTime date;
  /// The amount of money spent on fuel (in the user's selected currency).
  final double amount;

  // TODO Move fuelCost and fuelEfficiency to Car or Tank model when get created
  /// The fuel cost per unit (litre) in the selected currency.
  /// Default value in dollars per litre
  double fuelCost = 10.5;

  /// The efficiency factor (distance covered per litre of fuel).
  /// Default efficiency (meter per litre)
  double fuelEfficiency = 105.0;

  FuelLog({
    required this.date,
    required this.amount,
  });

  /// Calculates the amount of fuel added in litres.
  double get fuelAdded => amount / fuelCost;

  /// Calculates the estimated distance covered using the added fuel.
  double get estimatedDistance => fuelAdded * fuelEfficiency;

  @override
  String toString() {
    return 'FuelLog(date: $date, amount: $amount, fuelCost: $fuelCost, '
        'fuelAdded: $fuelAdded, estimatedDistance: $estimatedDistance)';
  }

}
