import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:low_fuel_alert/features/fuel/domain/entities/fuel_log.dart';
import '../blocs/bloc/fuel_bloc.dart';

class FuelPage extends StatelessWidget {
  const FuelPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Fuel Logs')),
      body: BlocBuilder<FuelBloc, FuelState>(
        builder: (context, state) {
          if (state is FuelSuccess) {
            return ListView.builder(
              itemCount: state.logs.length,
              itemBuilder: (context, index) {
                final FuelLog log = state.logs[index];
                return ListTile(
                  title: Text('Fuel: ${log.fuelAdded}'),
                  subtitle: Text('Amount: calculate the amount'),
                  trailing: Text('${log.date.toLocal()}'),
                );
              },
            );
          } else {
            return const Center(child: Text('No logs yet'));
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.read<FuelBloc>().add(AddFuel(
          FuelLog(date: DateTime.now(), fuelAdded: 10.5)
        )),
        child: Icon(Icons.add),
      ),
    );
  }
}
