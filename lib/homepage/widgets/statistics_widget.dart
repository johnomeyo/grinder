import 'package:flutter/material.dart';

class StatisticsWidget extends StatelessWidget {
  const StatisticsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildStatCard("Applied", "10", Colors.blueAccent),
        _buildStatCard("Interviews", "3", Colors.orangeAccent),
        _buildStatCard("Offers", "1", Colors.greenAccent),
      ],
    );
  }

  Widget _buildStatCard(String title, String count, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Column(
        children: [
          Text(count, style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold, color: color)),
          Text(title, style: TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}
