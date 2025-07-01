import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class PulseBarChart extends StatelessWidget {
  const PulseBarChart({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.3,
      child: BarChart(
        BarChartData(
          borderData: FlBorderData(show: false),
          alignment: BarChartAlignment.spaceAround,
          gridData: FlGridData(
            show: true,
            drawVerticalLine: false,
            drawHorizontalLine: true,
            horizontalInterval: 25,
            getDrawingHorizontalLine: (value) {
              return FlLine(
                color: Colors.grey.shade400,
                strokeWidth: 1,
                dashArray: [3, 3],
              );
            },
          ),
          maxY: 125,
          barGroups: [
            BarChartGroupData(
              x: 0,
              barRods: [
                BarChartRodData(toY: 65, color: Colors.deepPurple, width: 10),
              ],
            ),
            BarChartGroupData(
              x: 1,
              barRods: [
                BarChartRodData(toY: 100, color: Colors.deepPurple, width: 10),
              ],
            ),
            BarChartGroupData(
              x: 2,
              barRods: [
                BarChartRodData(toY: 60, color: Colors.deepPurple, width: 10),
              ],
            ),
            BarChartGroupData(
              x: 3,
              barRods: [
                BarChartRodData(toY: 110, color: Colors.deepPurple, width: 10),
              ],
            ),
            BarChartGroupData(
              x: 4,
              barRods: [
                BarChartRodData(toY: 85, color: Colors.deepPurple, width: 10),
              ],
            ),
            BarChartGroupData(
              x: 5,
              barRods: [
                BarChartRodData(toY: 55, color: Colors.deepPurple, width: 10),
              ],
            ),
            BarChartGroupData(
              x: 6,
              barRods: [
                BarChartRodData(toY: 105, color: Colors.deepPurple, width: 10),
              ],
            ),
            BarChartGroupData(
              x: 7,
              barRods: [
                BarChartRodData(toY: 75, color: Colors.deepPurple, width: 10),
              ],
            ),
            BarChartGroupData(
              x: 8,
              barRods: [
                BarChartRodData(toY: 100, color: Colors.deepPurple, width: 10),
              ],
            ),
            BarChartGroupData(
              x: 9,
              barRods: [
                BarChartRodData(toY: 80, color: Colors.deepPurple, width: 10),
              ],
            ),
            BarChartGroupData(
              x: 10,
              barRods: [
                BarChartRodData(toY: 60, color: Colors.deepPurple, width: 10),
              ],
            ),
          ],
          titlesData: FlTitlesData(
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 30,
                interval: 25,
                getTitlesWidget: (value, meta) => Text(
                  '${value.toInt()}',
                  style: TextStyle(color: Colors.white70, fontSize: 10),
                ),
              ),
            ),
            bottomTitles: AxisTitles(
              axisNameWidget: Text('5-Minute Buckets'),
              sideTitles: SideTitles(
                showTitles: true,
                interval: 2,
                getTitlesWidget: (value, meta) => Text(
                  '${value.toInt()}',
                  style: TextStyle(color: Colors.white70, fontSize: 10),
                ),
              ),
            ),
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          ),
        ),
      ),
    );
  }
}
