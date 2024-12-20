import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/widgets/platform_adaptive_widget.dart';
import '../../presentation/blocs/bloc/fuel_bloc.dart';
import '../../domain/entities/fuel_log.dart';

class FuelPage extends StatelessWidget {
  const FuelPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Fuel Logs')),
      body: PlatformAdaptiveWidget(
        mobileChild: _buildMobileLayout(context),
        desktopChild: _buildDesktopLayout(context),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addFuelLog(context),
        child: const Icon(Icons.add),
      ),
    );
  }

  /// Mobile layout: Compact list view
  Widget _buildMobileLayout(BuildContext context) {
    return BlocBuilder<FuelBloc, FuelState>(
      builder: (context, state) {
        if (state is FuelSuccess) {
          return ListView.builder(
            itemCount: state.logs.length,
            itemBuilder: (context, index) {
              final log = state.logs[index];
              return ListTile(
                title: Text('Fuel: ${log.fuelAdded} L'),
                // subtitle: Text('Mileage: ${log.mileage} km'),
                trailing: Text('${log.date.toLocal()}'),
              );
            },
          );
        }
        return const Center(child: Text('No logs yet'));
      },
    );
  }

  /// Desktop layout: Wide table-based view
  Widget _buildDesktopLayout(BuildContext context) {
    return BlocBuilder<FuelBloc, FuelState>(
      builder: (context, state) {
        if (state is FuelSuccess) {
          return DataTable(
            columns: const [
              DataColumn(label: Text('Date')),
              DataColumn(label: Text('Fuel Added (L)')),
              // DataColumn(label: Text('Mileage (km)')),
            ],
            rows: state.logs.map((log) {
              return DataRow(cells: [
                DataCell(Text('${log.date.toLocal()}')),
                DataCell(Text('${log.fuelAdded}')),
                // DataCell(Text('${log.mileage}')),
              ]);
            }).toList(),
          );
        }
        return const Center(child: Text('No logs yet'));
      },
    );
  }

  /// Function to add a sample fuel log
  void _addFuelLog(BuildContext context) {
    final log = FuelLog(
      date: DateTime.now(),
      fuelAdded: 10.5,
      // mileage: 150.0,
    );
    context.read<FuelBloc>().add(AddFuel(log));
  }
}