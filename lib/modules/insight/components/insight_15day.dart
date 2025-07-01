import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:omniview/config/theme/app_colors.dart';
import 'package:omniview/config/theme/app_theme.dart';

class Insight15day extends StatelessWidget {
  const Insight15day({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.2,
      child: LineChart(
        LineChartData(
          minY: 90,
          maxY: 110,
          lineBarsData: [
            LineChartBarData(
              isCurved: true,
              color: AppColors.primary,
              barWidth: 3,
              preventCurveOverShooting: true,
              spots: [
                FlSpot(0, 100),
                FlSpot(10, 95),
                FlSpot(20, 110),
                FlSpot(30, 105),
                FlSpot(40, 95),
              ],
              // showingIndicators: [1],
            ),
          ],
          titlesData: FlTitlesData(
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 40,
                getTitlesWidget: (value, meta) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Text(value.toInt().toString()),
                  );
                },
              ),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                reservedSize: 43,
                minIncluded: true,
                showTitles: true,
                getTitlesWidget: (value, meta) {
                  return Padding(
                    padding: const EdgeInsets.only(
                      top: 20,
                      // left: 40,
                    ),
                    child: Text(
                      value.toInt().toString(),
                      style: context.regular.copyWith(fontSize: 14),
                    ),
                  );
                },
                interval: 10,
              ),
            ),
            rightTitles: AxisTitles(),
            topTitles: AxisTitles(),
          ),
          clipData: FlClipData.none(),
          gridData: FlGridData(show: true),
          borderData: FlBorderData(show: false),
        ),
      ),
    );
  }
}
