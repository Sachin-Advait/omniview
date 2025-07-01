import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class PulseLineChart extends StatelessWidget {
  const PulseLineChart({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.3,
      child: LineChart(
        LineChartData(
          gridData: FlGridData(show: true),
          borderData: FlBorderData(show: false),
          titlesData: FlTitlesData(
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 30,
                getTitlesWidget: (value, meta) => Text(
                  '${value.toInt()}%',
                  style: TextStyle(color: Colors.white70, fontSize: 10),
                ),
                interval: 5,
              ),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, meta) {
                  return Text(
                    value.toInt().toString(),
                    style: TextStyle(color: Colors.white70, fontSize: 10),
                  );
                },
              ),
            ),
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          ),
          lineBarsData: [
            // Credit line
            LineChartBarData(
              isCurved: true,
              color: Colors.blueAccent,
              dotData: FlDotData(show: true),
              spots: [
                FlSpot(0, 10),
                FlSpot(10, 5),
                FlSpot(20, 8),
                FlSpot(30, 12),
                FlSpot(40, 15),
                FlSpot(50, 17),
                FlSpot(60, 18),
              ],
            ),
            // Debt line
            LineChartBarData(
              isCurved: true,
              color: Colors.pinkAccent,
              dotData: FlDotData(show: true),
              spots: [
                FlSpot(0, 5),
                FlSpot(10, 6),
                FlSpot(20, 8),
                FlSpot(30, 10),
                FlSpot(40, 5),
                FlSpot(50, 4),
                FlSpot(60, 3),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
