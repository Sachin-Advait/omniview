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
      child: LineChart(
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
                  color: AppColors.rosePink.withValues(alpha: 0.5),
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
                getTitlesWidget: (value, meta) {
                  if (value % interval != 0) {
                    return const SizedBox.shrink();
                  }
                  return Text(
                    value.toInt().toString(),
                    style: context.regular.copyWith(fontSize: 12),
                  );
                },
                interval: interval,
              ),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, meta) {
                  if (value % 10 != 0) {
                    return const SizedBox.shrink();
                  }
                  return Text(
                    value.toInt().toString(),
                    style: context.regular.copyWith(fontSize: 12),
                  );
                },
              ),
            ),
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          ),
          lineBarsData: [
            LineChartBarData(
              isCurved: true,
              color: AppColors.primary,
              dotData: FlDotData(show: true),
              spots: dataPoints,
            ),
          ],
        ),
      ),
    );
  }
}
