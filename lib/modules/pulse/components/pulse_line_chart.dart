import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:omniview/config/theme/app_colors.dart';
import 'package:omniview/config/theme/app_theme.dart';

class PulseLineChart extends StatelessWidget {
  const PulseLineChart({
    super.key,
    required this.dataPoints,
    required this.interval,
    this.spike,
  });

  final List<FlSpot> dataPoints;
  final double interval;
  final ExtraLinesData? spike;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2,
      child: TweenAnimationBuilder<double>(
        tween: Tween(begin: 0, end: 1),
        duration: const Duration(milliseconds: 900),
        curve: Curves.easeOutCubic,
        builder: (context, animationValue, _) {
          final animatedSpots = _getAnimatedSpots(animationValue);

          return LineChart(
            LineChartData(
              clipData: FlClipData.all(),
              gridData: FlGridData(
                show: true,
                drawVerticalLine: true,
                drawHorizontalLine: true,
                horizontalInterval: interval,
                verticalInterval: 10,
              ),
              rangeAnnotations: RangeAnnotations(
                verticalRangeAnnotations: [
                  if (spike == null)
                    VerticalRangeAnnotation(
                      x1: 40,
                      x2: 59,
                      color: AppColors.rosePink.withOpacity(0.5),
                    ),
                ],
              ),
              extraLinesData: spike,
              borderData: FlBorderData(
                show: true,
                border: const Border(
                  left: BorderSide(color: AppColors.white50, width: 0.5),
                  bottom: BorderSide(color: AppColors.white50, width: 0.5),
                  right: BorderSide.none,
                  top: BorderSide.none,
                ),
              ),
              titlesData: FlTitlesData(
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 30,
                    interval: interval,
                    getTitlesWidget: (value, meta) {
                      if (value % interval != 0) return const SizedBox.shrink();
                      return Text(
                        value.toInt().toString(),
                        style: context.regular.copyWith(fontSize: 12),
                      );
                    },
                  ),
                ),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: (value, meta) {
                      if (value % 10 != 0) return const SizedBox.shrink();
                      return Text(
                        value.toInt().toString(),
                        style: context.regular.copyWith(fontSize: 12),
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
                  barWidth: 3,
                  dotData: FlDotData(show: true),
                  spots: animatedSpots,
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  /// Animates points progressively from left to right
  List<FlSpot> _getAnimatedSpots(double progress) {
    final total = dataPoints.length;
    final visibleCount = (total * progress).clamp(0, total).floor();

    if (visibleCount <= 0) return [];

    final visibleSpots = dataPoints.sublist(0, visibleCount);

    // Smooth interpolation for the next point (fractional part)
    if (visibleCount < total) {
      final prev = dataPoints[visibleCount - 1];
      final next = dataPoints[visibleCount];
      final subProgress = (total * progress) - visibleCount;

      final interpolatedX = prev.x + (next.x - prev.x) * subProgress;
      final interpolatedY = prev.y + (next.y - prev.y) * subProgress;
      visibleSpots.add(FlSpot(interpolatedX, interpolatedY));
    }

    return visibleSpots;
  }
}
