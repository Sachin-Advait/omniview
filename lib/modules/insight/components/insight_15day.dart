import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:omniview/config/theme/app_colors.dart';
import 'package:omniview/config/theme/app_theme.dart';

class Insight15day extends StatelessWidget {
  const Insight15day({super.key});

  final List<FlSpot> dataPoints = const [
    FlSpot(0, 100),
    FlSpot(10, 95),
    FlSpot(20, 115),
    FlSpot(30, 105),
    FlSpot(40, 95),
    FlSpot(45, 85),
  ];

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.2,
      child: TweenAnimationBuilder<double>(
        tween: Tween<double>(begin: 0, end: 1),
        duration: const Duration(milliseconds: 900),
        curve: Curves.easeOutCubic,
        builder: (context, animationValue, _) {
          final animatedSpots = _getAnimatedSpots(animationValue);

          return LineChart(
            LineChartData(
              minY: 90,
              maxY: 120,
              maxX: 45,
              clipData: FlClipData.all(),
              gridData: FlGridData(
                show: true,
                drawVerticalLine: true,
                drawHorizontalLine: true,
                horizontalInterval: 10,
                verticalInterval: 10,
              ),
              extraLinesData: ExtraLinesData(
                horizontalLines: [
                  HorizontalLine(
                    y: 110,
                    color: AppColors.white.withValues(alpha: 0.5),
                    dashArray: [7, 6],
                    strokeWidth: 0.5,
                  ),
                ],
                verticalLines: [
                  VerticalLine(
                    x: 40,
                    color: AppColors.white.withValues(alpha: 0.5),
                    dashArray: [7, 6],
                    strokeWidth: 0.5,
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
                  spots: animatedSpots,
                ),
              ],
              titlesData: FlTitlesData(
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(
                    maxIncluded: false,
                    showTitles: true,
                    reservedSize: 40,
                    interval: 10,
                    getTitlesWidget: (value, _) {
                      if (value % 10 != 0) return const SizedBox.shrink();
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
                    reservedSize: 43,
                    maxIncluded: false,
                    showTitles: true,
                    getTitlesWidget: (value, _) {
                      if (value % 10 != 0) return const SizedBox.shrink();
                      return Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(
                          value.toInt().toString(),
                          style: context.regular.copyWith(fontSize: 14),
                        ),
                      );
                    },
                  ),
                ),
                rightTitles: const AxisTitles(),
                topTitles: const AxisTitles(),
              ),
            ),
          );
        },
      ),
    );
  }

  List<FlSpot> _getAnimatedSpots(double progress) {
    final totalPoints = dataPoints.length;
    final visibleCount = (totalPoints * progress).clamp(0, totalPoints).floor();

    if (visibleCount <= 0) return [];

    final visibleSpots = dataPoints.sublist(0, visibleCount);

    if (visibleCount < totalPoints) {
      final prev = dataPoints[visibleCount - 1];
      final next = dataPoints[visibleCount];
      final subProgress = (totalPoints * progress) - visibleCount;

      final interpolatedX = prev.x + (next.x - prev.x) * subProgress;
      final interpolatedY = prev.y + (next.y - prev.y) * subProgress;
      visibleSpots.add(FlSpot(interpolatedX, interpolatedY));
    }

    return visibleSpots;
  }
}
