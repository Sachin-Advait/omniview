import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:omniview/config/theme/app_colors.dart';
import 'package:omniview/config/theme/app_theme.dart';

class Insight6month extends StatelessWidget {
  const Insight6month({super.key});

  final List<double> barHeights = const [95, 80, 55, 80];

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2,
      child: TweenAnimationBuilder<double>(
        tween: Tween<double>(begin: 0, end: 1),
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeOutCubic,
        builder: (context, animationValue, _) {
          return BarChart(
            BarChartData(
              alignment: BarChartAlignment.spaceAround,
              minY: 0,
              maxY: 100,
              barGroups: List.generate(barHeights.length, (index) {
                return BarChartGroupData(
                  x: index,
                  barRods: [
                    BarChartRodData(
                      toY: barHeights[index] * animationValue,
                      borderRadius: BorderRadius.circular(4),
                      color: AppColors.primary,
                      width: 50,
                    ),
                  ],
                );
              }),
              titlesData: FlTitlesData(
                rightTitles: const AxisTitles(),
                topTitles: const AxisTitles(),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: (value, _) {
                      const labels = ['J', 'F', 'M', 'A'];
                      if (value.toInt() < labels.length) {
                        return Text(
                          labels[value.toInt()],
                          style: context.medium.copyWith(fontSize: 15),
                        );
                      }
                      return const SizedBox.shrink();
                    },
                  ),
                ),
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 30,
                    getTitlesWidget: (value, meta) => Text(
                      value.toInt().toString(),
                      style: context.regular,
                      textAlign: TextAlign.center,
                    ),
                  ),
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
                verticalInterval: 1,
              ),
            ),
          );
        },
      ),
    );
  }
}
