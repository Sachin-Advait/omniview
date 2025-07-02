import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:omniview/config/theme/app_colors.dart';
import 'package:omniview/config/theme/app_theme.dart';

class PulseBarChart extends StatelessWidget {
  const PulseBarChart({super.key});

  @override
  Widget build(BuildContext context) {
    final values = [65, 100, 60, 110, 85, 55, 105, 75, 100, 80, 60];

    final barGroups = List.generate(values.length, (index) {
      final value = values[index];
      return BarChartGroupData(
        x: index,
        barRods: [
          BarChartRodData(
            toY: value.toDouble(),
            color: Colors.deepPurple,
            width: 10,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(2),
              topRight: Radius.circular(2),
            ),
          ),
        ],
      );
    });

    return AspectRatio(
      aspectRatio: 1.3,
      child: BarChart(
        BarChartData(
          borderData: FlBorderData(
            show: true,
            border: const Border(
              left: BorderSide(color: AppColors.white50, width: 0.5),
              bottom: BorderSide(color: AppColors.white50, width: 0.5),
              right: BorderSide.none,
              top: BorderSide.none,
            ),
          ),
          alignment: BarChartAlignment.spaceAround,
          gridData: FlGridData(
            show: true,
            drawVerticalLine: true,
            drawHorizontalLine: true,
            horizontalInterval: 50,
          ),
          barGroups: barGroups,
          titlesData: FlTitlesData(
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 30,
                interval: 50,
                maxIncluded: false,
              ),
            ),
            bottomTitles: AxisTitles(
              axisNameWidget: Text('5-Minute Buckets'),
              sideTitles: SideTitles(
                showTitles: true,
                interval: 2,
                getTitlesWidget: (value, meta) {
                  if (value % 2 == 0) {
                    return Text(
                      '${value.toInt()}',
                      style: context.medium.copyWith(fontSize: 12),
                    );
                  }
                  return SizedBox();
                },
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
