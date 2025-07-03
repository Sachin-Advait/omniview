import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:omniview/config/theme/app_colors.dart';
import 'package:omniview/config/theme/app_theme.dart';

class PulseBarChart extends StatefulWidget {
  const PulseBarChart({super.key});

  @override
  State<PulseBarChart> createState() => _PulseBarChartState();
}

class _PulseBarChartState extends State<PulseBarChart> {
  final List<int> values = [65, 100, 60, 110, 85, 55, 105, 75, 100, 80, 60];

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.3,
      child: TweenAnimationBuilder<double>(
        tween: Tween(begin: 0, end: 1),
        duration: const Duration(milliseconds: 900),
        curve: Curves.easeOutCubic,
        builder: (context, animationValue, _) {
          final barGroups = List.generate(values.length, (index) {
            final animatedHeight = values[index] * animationValue;
            return BarChartGroupData(
              x: index,
              barRods: [
                BarChartRodData(
                  toY: animatedHeight,
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

          return BarChart(
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
                  axisNameWidget: Text(
                    '5-Minute Buckets',
                    style: context.medium.copyWith(fontSize: 12),
                  ),
                  sideTitles: SideTitles(
                    showTitles: true,
                    interval: 2,
                    getTitlesWidget: (value, _) {
                      if (value % 2 == 0) {
                        return Text(
                          '${value.toInt()}',
                          style: context.regular.copyWith(fontSize: 14),
                        );
                      }
                      return const SizedBox();
                    },
                  ),
                ),
                topTitles: const AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                rightTitles: const AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
