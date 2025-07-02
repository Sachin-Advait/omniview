import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:omniview/config/theme/app_colors.dart';
import 'package:omniview/config/theme/app_theme.dart';

class Insight6month extends StatelessWidget {
  const Insight6month({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2,
      child: BarChart(
        BarChartData(
          alignment: BarChartAlignment.spaceAround,
          minY: 0,
          maxY: 100,
          barGroups: [
            BarChartGroupData(
              x: 0,
              barRods: [
                BarChartRodData(
                  toY: 95,
                  borderRadius: BorderRadius.circular(4),
                  color: AppColors.primary,
                  width: 50,
                ),
              ],
            ),
            BarChartGroupData(
              x: 1,
              barRods: [
                BarChartRodData(
                  toY: 80,
                  borderRadius: BorderRadius.circular(4),
                  color: AppColors.primary,
                  width: 50,
                ),
              ],
            ),
            BarChartGroupData(
              x: 2,
              barRods: [
                BarChartRodData(
                  toY: 55,
                  borderRadius: BorderRadius.circular(4),
                  color: AppColors.primary,
                  width: 50,
                ),
              ],
            ),
            BarChartGroupData(
              x: 3,
              barRods: [
                BarChartRodData(
                  toY: 80,
                  borderRadius: BorderRadius.circular(4),
                  color: AppColors.primary,
                  width: 50,
                ),
              ],
            ),
          ],

          titlesData: FlTitlesData(
            rightTitles: AxisTitles(),
            topTitles: AxisTitles(),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, _) {
                  const labels = ['J', 'F', 'M', 'A'];
                  return Text(
                    labels[value.toInt()],
                    style: context.medium.copyWith(fontSize: 15),
                  );
                },
              ),
            ),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: true, reservedSize: 30),
            ),
          ),
          borderData: FlBorderData(
            show: true,
            border: const Border(
              left: BorderSide(color: AppColors.white50, width: 0.5),
              bottom: BorderSide(color: AppColors.white50, width: 0.5),
              right: BorderSide.none,
              top: BorderSide.none,
            ),
          ),
          gridData: FlGridData(
            show: true,
            drawVerticalLine: true,
            drawHorizontalLine: true,
            horizontalInterval: 50,
            verticalInterval: .1,
          ),
        ),
      ),
    );
  }
}
