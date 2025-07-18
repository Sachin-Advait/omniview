import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:omniview/common/widgets/labeled_dount_chart.dart';
import 'package:omniview/common/widgets/radical_progess_chart.dart';
import 'package:omniview/config/theme/app_colors.dart';
import 'package:omniview/config/theme/app_theme.dart';
import 'package:omniview/data/models/chart_model.dart';
import 'package:omniview/data/models/tab_model.dart';

class PieAndDountChart extends StatelessWidget {
  const PieAndDountChart({super.key, required this.tab});

  final TabModel tab;

  @override
  Widget build(BuildContext context) {
    final donutChart = tab.charts.firstWhere((c) => c.type == Type.DONUT_CHART);
    final radialChart = tab.charts.firstWhere(
      (c) => c.type == Type.RADIAL_PROGRESS,
    );
    final donutSections = donutChart.data.sections!;
    final targetValues = donutSections.map((s) => s.value.toDouble()).toList();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        children: [
          LabeledDonutChart(
            title: donutChart.title,
            targetValues: targetValues,
            sectionBuilder: List.generate(donutSections.length, (i) {
              final section = donutSections[i];
              return (double animatedValue) {
                return PieChartSectionData(
                  value: animatedValue,
                  title: section.title.name,
                  titlePositionPercentageOffset: 1.6,
                  color: _mapColor(section.color),
                  radius: 20,
                  titleStyle: context.medium.copyWith(fontSize: 12),
                );
              };
            }),
          ),

          20.verticalSpace,
          RadialProgressChart(
            title: radialChart.title,
            progress: radialChart.data.progress!.toDouble(),
          ),
        ],
      ),
    );
  }

  Color _mapColor(ColorType key) {
    switch (key) {
      case ColorType.PRIMARY:
        return AppColors.primary;
      case ColorType.ROYAL_BLUE:
        return AppColors.royalBlue;
      case ColorType.LIME_GREEN:
        return AppColors.limeGreen;
    }
  }
}
