import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:omniview/config/theme/app_colors.dart';
import 'package:omniview/config/theme/app_theme.dart';

class Insight12month extends StatelessWidget {
  const Insight12month({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.2,
      child: LineChart(
        LineChartData(
          clipData: FlClipData.all(),
          minY: 0,
          maxY: 100,
          maxX: 10,
          gridData: FlGridData(
            show: true,
            drawVerticalLine: true,
            drawHorizontalLine: true,
            horizontalInterval: 50,
            verticalInterval: 2,
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
          extraLinesData: ExtraLinesData(
            horizontalLines: [
              HorizontalLine(
                y: 100,
                color: AppColors.white.withValues(alpha: .3),
                dashArray: [7, 6],
                strokeWidth: .5,
              ),
            ],
            verticalLines: [
              VerticalLine(
                x: 10,
                color: AppColors.white.withValues(alpha: .3),
                dashArray: [7, 6],
                strokeWidth: .5,
              ),
            ],
          ),

          titlesData: FlTitlesData(
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 30,
                getTitlesWidget: (value, meta) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Text(
                      value.toInt().toString(),
                      style: context.medium.copyWith(fontSize: 13),
                    ),
                  );
                },
              ),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 43,
                getTitlesWidget: (value, meta) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Text(
                      value.toInt().toString(),
                      style: context.medium.copyWith(fontSize: 13),
                    ),
                  );
                },
                interval: 2,
              ),
            ),
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          ),
          lineBarsData: [
            LineChartBarData(
              isCurved: true,
              color: AppColors.primary,
              barWidth: 2,
              dotData: FlDotData(show: false),
              belowBarData: BarAreaData(
                show: true,
                color: AppColors.primary.withValues(
                  alpha: 0.3,
                ), // 💡 soft blue fill
              ),
              spots: const [
                FlSpot(0, 100),
                FlSpot(1, 85),
                FlSpot(2, 90),
                FlSpot(3, 70),
                FlSpot(4, 80),
                FlSpot(5, 75),
                FlSpot(6, 80),
                FlSpot(7, 82),
                FlSpot(8, 90),
                FlSpot(9, 72),
                FlSpot(10, 71),
                FlSpot(11, 51),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
