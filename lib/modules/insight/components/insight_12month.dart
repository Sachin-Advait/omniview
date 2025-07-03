import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:omniview/config/theme/app_colors.dart';
import 'package:omniview/config/theme/app_theme.dart';

class Insight12month extends StatelessWidget {
  const Insight12month({super.key});

  final List<FlSpot> dataPoints = const [
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
  ];

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.2,
      child: TweenAnimationBuilder<double>(
        tween: Tween(begin: 0, end: 1),
        duration: const Duration(milliseconds: 900),
        curve: Curves.easeOutCubic,
        builder: (context, animationValue, _) {
          final animatedSpots = _getAnimatedSpots(animationValue);

          return LineChart(
            LineChartData(
              clipData: FlClipData.all(),
              minY: 0,
              maxY: 100,
              maxX: 11,
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
                    color: AppColors.white.withOpacity(0.3),
                    dashArray: [7, 6],
                    strokeWidth: .5,
                  ),
                ],
                verticalLines: [
                  VerticalLine(
                    x: 10,
                    color: AppColors.white.withOpacity(0.3),
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
                    maxIncluded: false,
                    reservedSize: 43,
                    interval: 2,
                    getTitlesWidget: (value, meta) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Text(
                          value.toInt().toString(),
                          style: context.medium.copyWith(fontSize: 13),
                        ),
                      );
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
              lineBarsData: [
                LineChartBarData(
                  isCurved: true,
                  color: AppColors.primary,
                  barWidth: 2,
                  dotData: FlDotData(show: false),
                  belowBarData: BarAreaData(
                    show: true,
                    color: AppColors.primary.withOpacity(0.3),
                  ),
                  spots: animatedSpots,
                ),
              ],
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
      // Add one interpolated spot between last visible and next
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
