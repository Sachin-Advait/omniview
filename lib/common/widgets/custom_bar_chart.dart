import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:omniview/config/theme/app_colors.dart';
import 'package:omniview/config/theme/app_theme.dart';

class CustomBarChart extends StatelessWidget {
  final String title;
  final List<double> values;
  final double minY;
  final double maxY;
  final double benchmarkY;

  const CustomBarChart({
    super.key,
    required this.title,
    required this.values,
    this.minY = 0,
    this.maxY = 100,
    this.benchmarkY = 65,
  });

  @override
  Widget build(BuildContext context) {
    final barGroups = values.asMap().entries.map((entry) {
      final index = entry.key;
      final value = entry.value;
      return BarChartGroupData(
        x: index,
        barRods: [
          BarChartRodData(
            toY: value,
            borderRadius: BorderRadius.circular(4),
            color: AppColors.primary,
            width: 50,
          ),
        ],
      );
    }).toList();

    return GestureDetector(
      onHorizontalDragStart: (_) {},
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: context.medium.copyWith(fontSize: 16)),
          15.verticalSpace,
          AspectRatio(
            aspectRatio: 1.8,
            child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: BarChart(
                transformationConfig: FlTransformationConfig(
                  panEnabled: true,
                  scaleEnabled: true,
                  scaleAxis: FlScaleAxis.free,
                ),
                duration: Duration(milliseconds: 800),
                curve: Curves.easeInOut,
                
                BarChartData(
                  alignment: BarChartAlignment.spaceAround,
                  minY: minY,
                  maxY: maxY,
                  barTouchData: BarTouchData(
                    enabled: true,
                    handleBuiltInTouches: true,
                  ),
                  extraLinesData: ExtraLinesData(
                    horizontalLines: [
                      HorizontalLine(
                        y: benchmarkY,
                        color: AppColors.limeGreen,
                        strokeWidth: 2,
                        dashArray: [8, 4],
                        label: HorizontalLineLabel(
                          show: true,
                          alignment: Alignment.topRight,
                          style: context.medium.copyWith(
                            color: AppColors.limeGreen,
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ],
                  ),
                  barGroups: barGroups,
                  titlesData: FlTitlesData(
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        interval: 1,
                        getTitlesWidget: (value, _) {
                          const labels = ['Q1', 'Q2', 'Q3', 'Q4'];
                          final index = value.toInt();
                          if (index < 0 || index >= labels.length) {
                            return const SizedBox.shrink();
                          }
                          return Text(
                            labels[index],
                            style: const TextStyle(fontSize: 12),
                          );
                        },
                      ),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 30,
                      ),
                    ),
                    rightTitles: AxisTitles(),
                    topTitles: AxisTitles(),
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
                    horizontalInterval: 25,
                    verticalInterval: 0.1,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
