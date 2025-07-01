import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:omniview/common/widgets/chart_card.dart';
import 'package:omniview/config/theme/app_colors.dart';
import 'package:omniview/config/theme/app_theme.dart';

class Growth extends StatelessWidget {
  const Growth({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ChartCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Enterprise Health Score',
                style: context.medium.copyWith(fontSize: 18),
              ),
              25.verticalSpace,
              AspectRatio(
                aspectRatio: 2.2,
                child: LineChart(
                  LineChartData(
                    minY: 50,
                    maxY: 100,
                    lineBarsData: [
                      LineChartBarData(
                        isCurved: true,
                        color: AppColors.primary,
                        barWidth: 3,
                        preventCurveOverShooting: true,
                        spots: [
                          FlSpot(0, 80),
                          FlSpot(1, 70),
                          FlSpot(2, 90),
                          FlSpot(3, 75),
                          FlSpot(4, 95),
                          FlSpot(5, 70),
                        ],
                        // showingIndicators: [1],
                      ),
                    ],
                    titlesData: FlTitlesData(
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          reservedSize: 40,
                          getTitlesWidget: (value, meta) {
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
                            const days = ['07 Jun', '', '17 Jun', '', '27 Jun'];
                            final index = value.toInt();
                            if (index < 0 || index >= days.length) {
                              return const SizedBox.shrink();
                            }

                            return Padding(
                              padding: const EdgeInsets.only(
                                top: 20,
                                // left: 40,
                              ),
                              child: Text(
                                days[index],
                                style: context.regular.copyWith(fontSize: 14),
                              ),
                            );
                          },
                          interval: 2,
                        ),
                      ),
                      rightTitles: AxisTitles(),
                      topTitles: AxisTitles(),
                    ),
                    clipData: FlClipData.none(),
                    gridData: FlGridData(show: true),
                    borderData: FlBorderData(show: false),
                  ),
                ),
              ),
            ],
          ),
        ),
        20.verticalSpace,

        ChartCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Revenue Achievement %',
                style: context.medium.copyWith(fontSize: 18),
              ),
              25.verticalSpace,
              AspectRatio(
                aspectRatio: 2,
                child: BarChart(
                  BarChartData(
                    alignment: BarChartAlignment.spaceAround,
                    minY: 0,
                    maxY: 100,
                    extraLinesData: ExtraLinesData(
                      horizontalLines: [
                        HorizontalLine(
                          y: 0,
                          color: Colors.grey,
                          strokeWidth: 1,
                          dashArray: [5, 3],
                        ),
                      ],
                      verticalLines: [
                        VerticalLine(
                          x: 0,
                          strokeCap: StrokeCap.round,
                          color: Colors.teal,
                          strokeWidth: 1,
                          dashArray: [5, 3],
                        ),
                      ],
                    ),
                    barGroups: [
                      BarChartGroupData(
                        x: 0,
                        barRods: [
                          BarChartRodData(
                            toY: 95,
                            borderRadius: BorderRadius.circular(4),
                            color: AppColors.primary,
                            width: 50,
                          ),
                        ],
                      ),
                      BarChartGroupData(
                        x: 1,
                        barRods: [
                          BarChartRodData(
                            toY: 80,
                            borderRadius: BorderRadius.circular(4),
                            color: AppColors.primary,
                            width: 50,
                          ),
                        ],
                      ),
                      BarChartGroupData(
                        x: 2,
                        barRods: [
                          BarChartRodData(
                            toY: 55,
                            borderRadius: BorderRadius.circular(4),
                            color: AppColors.primary,
                            width: 50,
                          ),
                        ],
                      ),
                      BarChartGroupData(
                        x: 3,
                        barRods: [
                          BarChartRodData(
                            toY: 80,
                            borderRadius: BorderRadius.circular(4),
                            color: AppColors.primary,
                            width: 50,
                          ),
                        ],
                      ),
                    ],

                    titlesData: FlTitlesData(
                      rightTitles: AxisTitles(),
                      topTitles: AxisTitles(),
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget: (value, _) {
                            const labels = ['Q1', 'Q2', 'Q3', 'Q4'];
                            return Text(
                              labels[value.toInt()],
                              style: TextStyle(fontSize: 12),
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
                    ),
                    borderData: FlBorderData(show: false),
                    gridData: FlGridData(
                      show: true,
                      drawVerticalLine:
                          false, // We'll draw custom vertical lines
                      drawHorizontalLine: true,
                      horizontalInterval: 25,
                      getDrawingHorizontalLine: (value) {
                        return FlLine(
                          color: Colors.grey.shade400,
                          strokeWidth: 1,
                          dashArray: [3, 3], // Horizontal dashed lines
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
