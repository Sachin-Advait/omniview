import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:omniview/config/theme/app_colors.dart';
import 'package:omniview/config/theme/app_theme.dart';

class CustomLineChart extends StatelessWidget {
  final String title;
  final List<FlSpot> dataPoints;
  final double minY;
  final double maxY;
  final double benchmarkY;

  const CustomLineChart({
    super.key,
    required this.title,
    required this.dataPoints,
    this.minY = 0,
    this.maxY = 100,
    this.benchmarkY = 80,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: context.medium.copyWith(fontSize: 16)),
        15.verticalSpace,
        GestureDetector(
          onHorizontalDragStart: (_) {},
          child: AspectRatio(
            aspectRatio: 1.8,
            child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: LineChart(
                transformationConfig: FlTransformationConfig(
                  panEnabled: true,
                  scaleEnabled: true,
                  scaleAxis: FlScaleAxis.free,
                ),
                duration: Duration(milliseconds: 800),
                curve: Curves.easeInOut,
                LineChartData(
                  clipData: FlClipData.none(),
                  lineTouchData: LineTouchData(
                    enabled: true,
                    handleBuiltInTouches: true,
                  ),
                  minY: minY,
                  maxY: maxY,
                  lineBarsData: [
                    LineChartBarData(
                      isCurved: true,
                      color: AppColors.primary,
                      barWidth: 3,
                      preventCurveOverShooting: true,
                      spots: dataPoints,
                    ),
                  ],
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
                  titlesData: FlTitlesData(
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 30,
                      ),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        interval: 1,
                        getTitlesWidget: (value, _) {
                          final index = value.toInt();
                          switch (index) {
                            case 1:
                              return Transform.rotate(
                                angle: -0.7, // Diagonal
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 12),
                                  child: Text(
                                    '07 Jun',
                                    style: context.regular.copyWith(
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              );
                            case 3:
                              return Transform.rotate(
                                angle: -0.7,
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 12),
                                  child: Text(
                                    '17 Jun',
                                    style: context.regular.copyWith(
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              );
                            case 5:
                              return Transform.rotate(
                                angle: -0.7,
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 12),
                                  child: Text(
                                    '27 Jun',
                                    style: context.regular.copyWith(
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              );
                            default:
                              return const SizedBox.shrink();
                          }
                        },
                        reservedSize: 40,
                      ),
                    ),

                    rightTitles: AxisTitles(),
                    topTitles: AxisTitles(),
                  ),
                  gridData: FlGridData(show: true),
                  borderData: FlBorderData(
                    show: true,
                    border: const Border(
                      left: BorderSide(color: AppColors.white50, width: 0.5),
                      bottom: BorderSide(color: AppColors.white50, width: 0.5),
                      right: BorderSide.none,
                      top: BorderSide.none,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
