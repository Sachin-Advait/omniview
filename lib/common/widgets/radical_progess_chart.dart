import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:omniview/common/widgets/chart_card.dart';
import 'package:omniview/config/theme/app_colors.dart';
import 'package:omniview/config/theme/app_theme.dart';

class RadialProgressChart extends StatelessWidget {
  final String title;
  final double progress; // e.g. 31 means 31%
  final double aspectRatio;
  final double radius;
  final Color backgroundColor;
  final Color progressColor;

  const RadialProgressChart({
    super.key,
    required this.title,
    required this.progress,
    this.aspectRatio = 3,
    this.radius = 25,
    this.backgroundColor = AppColors.white50,
    this.progressColor = AppColors.royalBlue,
  });

  @override
  Widget build(BuildContext context) {
    return ChartCard(
      child: Column(
        children: [
          Text(title, style: context.medium.copyWith(fontSize: 16)),
          25.verticalSpace,
          AspectRatio(
            aspectRatio: aspectRatio,
            child: TweenAnimationBuilder<double>(
              tween: Tween<double>(begin: 0, end: progress),
              duration: const Duration(milliseconds: 800),
              curve: Curves.easeOutCubic,
              builder: (context, animatedProgress, _) {
                return Stack(
                  alignment: Alignment.center,
                  children: [
                    // Background arc
                    PieChart(
                      PieChartData(
                        sectionsSpace: 0,
                        centerSpaceRadius: 40,
                        startDegreeOffset: -90,
                        sections: [
                          PieChartSectionData(
                            value: 100,
                            color: backgroundColor,
                            radius: radius,
                            showTitle: false,
                          ),
                        ],
                      ),
                    ),
                    // Foreground arc (progress)
                    PieChart(
                      PieChartData(
                        sectionsSpace: 0,
                        centerSpaceRadius: 40,
                        startDegreeOffset: -90,
                        sections: [
                          PieChartSectionData(
                            value: animatedProgress,
                            color: progressColor,
                            radius: radius,
                            showTitle: false,
                          ),
                          PieChartSectionData(
                            value: 100 - animatedProgress,
                            color: Colors.transparent,
                            radius: radius,
                            showTitle: false,
                          ),
                        ],
                      ),
                    ),
                    Text(
                      '${animatedProgress.toInt()}%',
                      style: context.medium.copyWith(fontSize: 18),
                    ),
                  ],
                );
              },
            ),
          ),
          20.verticalSpace,
        ],
      ),
    );
  }
}
