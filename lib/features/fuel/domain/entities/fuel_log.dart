/// Register the log history etch time you add fuel to tank.
/// 
/// [date] the time that the fuel get added to the tank.
/// 
/// [fuelAdded] is the amount of fuel (unit) get added.
// Todo replace fuelAdded by amount of money added, calculate the fuel added by saving a global variable
// todo rate exchange from money to fuel; calculate the same wey to how match in kilometer that amount going to rest
class FuelLog {
  final DateTime date;
  final double fuelAdded;

  FuelLog({
    required this.date,
    required this.fuelAdded,
  });
}
