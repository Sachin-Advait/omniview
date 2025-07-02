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
          // maxY: 110,
          // maxX: 40,
          gridData: FlGridData(
            show: true,
            drawVerticalLine: true,
            drawHorizontalLine: true,
            horizontalInterval: 50,
            verticalInterval: 10,
          ),
          extraLinesData: ExtraLinesData(
            horizontalLines: [
              HorizontalLine(
                y: 110,
                color: AppColors.white.withValues(alpha: .5),
                dashArray: [7, 6],
                strokeWidth: .5,
              ),
            ],
            verticalLines: [
              VerticalLine(
                x: 40,
                color: AppColors.white.withValues(alpha: .5),
                dashArray: [7, 6],
                strokeWidth: .5,
              ),
            ],
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
          lineBarsData: [
            LineChartBarData(
              isCurved: true,
              color: AppColors.primary,
              barWidth: 3,
              preventCurveOverShooting: true,
              spots: [
                FlSpot(0, 100),
                FlSpot(10, 95),
                FlSpot(20, 115),
                FlSpot(30, 105),
                FlSpot(40, 95),
                FlSpot(45, 85),
              ],
              // showingIndicators: [1],
            ),
          ],
          titlesData: FlTitlesData(
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 40,
                interval: 10,
                getTitlesWidget: (value, meta) {
                  if (value % 10 != 0) {
                    return const SizedBox.shrink();
                  }
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
                  if (value % 10 != 0) {
                    return const SizedBox.shrink();
                  }

                  return Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Text(
                      value.toInt().toString(),
                      style: context.regular.copyWith(fontSize: 14),
                    ),
                  );
                },
              ),
            ),
            rightTitles: AxisTitles(),
            topTitles: AxisTitles(),
          ),
          clipData: FlClipData.all(),
        ),
      ),
    );
  }
}
