import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ResponseTimeChart extends StatelessWidget {
  const ResponseTimeChart({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: LineChart(
        LineChartData(
          gridData: FlGridData(show: false),
          titlesData: FlTitlesData(
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, meta) {
                  return Text("Day ${value.toInt()}");
                },
              ),
            ),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: true),
            ),
             rightTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
             topTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
          ),
          borderData: FlBorderData(show: false),
          lineBarsData: [
            LineChartBarData(
              spots: [
                FlSpot(1, 3), // Day 1: 3 days response time
                FlSpot(2, 5), // Day 2: 5 days response time
                FlSpot(3, 2), // Day 3: 2 days response time
                FlSpot(4, 6), // Day 4: 6 days response time
                FlSpot(5, 4), // Day 5: 4 days response time
              ],
              isCurved: true,
              color: Colors.blue,
              dotData: FlDotData(show: false),
            ),
          ],
        ),
      ),
    );
  }
}
