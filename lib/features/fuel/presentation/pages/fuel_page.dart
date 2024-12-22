import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/widgets/platform_adaptive_widget.dart';
import '../../presentation/blocs/bloc/fuel_bloc.dart';
import '../../domain/entities/fuel_log.dart';
import '../widgets/fuel_trend_chart.dart';

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
          return Column(
            children: [
              Expanded(child: FuelTrendChart(fuelLogs: state.logs)),
              Expanded(
                child: ListView.builder(
                  itemCount: state.logs.length,
                  itemBuilder: (context, index) {
                    final log = state.logs[index];
                    final DateTime date = log.date.toLocal();
                    return ListTile(
                      title: Text('Cost: ${log.amount} Dz'),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Fuel Added: ${log.fuelAdded.toStringAsFixed(2)} L'),
                          Text('Estimated Distance: ${log.fuelAdded.toStringAsFixed(2)} m'),
                        ],
                      ),
                      trailing: Text('${date.year}-${date.month}-${date.day}'),
                    );
                  },
                ),
              ),
            ],
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
          return Column(
            children: [
              Expanded(child: FuelTrendChart(fuelLogs: state.logs)),
              Expanded(
                child: SingleChildScrollView(
                  child: DataTable(
                    columns: const [
                      DataColumn(label: Text('Date')),
                      DataColumn(label: Expanded(child: Text('Cost (Dz)'))),
                      DataColumn(label: Expanded(child: Text('Fuel Added (L)'))),
                      DataColumn(label: Expanded(child: Text('Estimated Distance (m)'))),
                    ],
                    rows: state.logs.map((log) {
                      final DateTime date = log.date.toLocal();
                      return DataRow(cells: [
                        DataCell(Text('${date.year}-${date.month}-${date.day}')),
                        DataCell(Text('${log.amount}')),
                        DataCell(Text(log.fuelAdded.toStringAsFixed(2))),
                        DataCell(Text(log.estimatedDistance.toStringAsFixed(2))),
                      ]);
                    }).toList(),
                  ),
                ),
              )
            ],
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
      amount: 500.0,
      // mileage: 150.0,
    );
    context.read<FuelBloc>().add(AddFuel(log));
  }
}
