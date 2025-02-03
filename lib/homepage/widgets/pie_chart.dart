import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ApplicationPieChart extends StatelessWidget {
  const ApplicationPieChart({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: PieChart(
        PieChartData(
          sections: _getPieChartSections(),
          borderData: FlBorderData(show: false),
        ),
      ),
    );
  }

  List<PieChartSectionData> _getPieChartSections() {
    return [
      PieChartSectionData(value: 5, color: Colors.green, title: "Accepted"),
      PieChartSectionData(value: 8, color: Colors.red, title: "Rejected"),
      PieChartSectionData(value: 3, color: Colors.orange, title: "Pending"),
    ];
  }
}
