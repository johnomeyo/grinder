import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ApplicationStatsChart extends StatelessWidget {
  const ApplicationStatsChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SizedBox(
        height: 200,
        child: BarChart(
          BarChartData(
            alignment: BarChartAlignment.spaceAround,
            barGroups: _getBarGroups(),
            titlesData: FlTitlesData(
              leftTitles: AxisTitles(
                sideTitles: SideTitles(showTitles: true, reservedSize: 40),
              ),
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  getTitlesWidget: (value, meta) {
                    switch (value.toInt()) {
                      case 0:
                        return const Text('Accepted');
                      case 1:
                        return const Text('Rejected');
                      case 2:
                        return const Text('Pending');
                      default:
                        return const Text('');
                    }
                  },
                ),
              ),
            ),
            borderData: FlBorderData(show: false),
            gridData: FlGridData(show: false),
          ),
        ),
      ),
    );
  }

  List<BarChartGroupData> _getBarGroups() {
    return [
      BarChartGroupData(x: 0, barRods: [
        BarChartRodData(toY: 5, color: Colors.green, width: 20)
      ]),
      BarChartGroupData(x: 1, barRods: [
        BarChartRodData(toY: 8, color: Colors.red, width: 20)
      ]),
      BarChartGroupData(x: 2, barRods: [
        BarChartRodData(toY: 3, color: Colors.orange, width: 20)
      ]),
    ];
  }
}
