import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '../../domain/entities/fuel_log.dart';

/// Displays a line chart showing trends in fuel usage or mileage.
class FuelTrendChart extends StatelessWidget {
  final List<FuelLog> fuelLogs;

  const FuelTrendChart({required this.fuelLogs, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: const Text(
                'Fuel Trends',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              flex: 6,
              child: LineChart(
                _createChartData(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Creates the chart data based on fuel logs.
  LineChartData _createChartData() {
    // Sort logs by date for proper visualization
    final sortedLogs = fuelLogs..sort((a, b) => a.date.compareTo(b.date));

    // Create the data points
    final List<FlSpot> amountSpots = [];
    final List<FlSpot> fuelSpots = [];
    for (int i = 0; i < sortedLogs.length; i++) {
      final log = sortedLogs[i];
      amountSpots.add(FlSpot(i.toDouble(), log.amount));
      fuelSpots.add(FlSpot(i.toDouble(), log.fuelAdded.ceilToDouble()));
    }

    return LineChartData(
      gridData: FlGridData(show: true),
      titlesData: FlTitlesData(
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              interval: 1,
              getTitlesWidget: (value, meta) {
                if (value.toInt() < sortedLogs.length) {
                  final date = sortedLogs[value.toInt()].date;
                  return Text('${date.month}/${date.day}');
                }
                return const Text('');
              },
            ),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false))),
      borderData: FlBorderData(
        show: true,
        border: Border.all(color: Colors.grey, width: 1),
      ),
      lineBarsData: [
        LineChartBarData(
          spots: amountSpots,
          isCurved: true,
          color: Colors.blue,
          barWidth: 3,
          belowBarData: BarAreaData(show: false),
          dotData: FlDotData(show: true),
        ),
        LineChartBarData(
          spots: fuelSpots,
          isCurved: true,
          color: Colors.greenAccent,
          barWidth: 3,
          belowBarData: BarAreaData(show: false),
          dotData: FlDotData(show: true),
        ),
      ],
    );
  }
}
