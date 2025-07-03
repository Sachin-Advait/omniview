import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:omniview/common/widgets/chart_card.dart';
import 'package:omniview/config/theme/app_theme.dart';

class LabeledDonutChart extends StatelessWidget {
  final String title;
  final List<double> targetValues;
  final List<PieChartSectionData Function(double)> sectionBuilder;
  final double aspectRatio;

  const LabeledDonutChart({
    super.key,
    required this.title,
    required this.targetValues,
    required this.sectionBuilder,
    this.aspectRatio = 3.8,
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
              tween: Tween(begin: 0, end: 1),
              duration: const Duration(milliseconds: 800),
              curve: Curves.easeOutCubic,
              builder: (context, animationValue, _) {
                final animatedSections = List.generate(
                  targetValues.length,
                  (i) => sectionBuilder[i](targetValues[i] * animationValue),
                );

                return PieChart(
                  PieChartData(
                    sectionsSpace: 0,
                    centerSpaceRadius: 40,
                    startDegreeOffset: -90,
                    sections: animatedSections,
                  ),
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
