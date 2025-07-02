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
    final donutChart = tab.charts.firstWhere((c) => c.type == 'donutChart');
    final radialChart = tab.charts.firstWhere(
      (c) => c.type == 'radialProgress',
    );

    final donutData = donutChart.data as DonutChartDataModel;
    final radialData = radialChart.data as RadialProgressDataModel;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        children: [
          LabeledDonutChart(
            title: donutChart.title,
            sections: donutData.sections.map((section) {
              return PieChartSectionData(
                value: section.value,
                title: section.title,
                titlePositionPercentageOffset: 1.6,
                color: _mapColor(section.color),
                radius: 20,
                titleStyle: context.medium.copyWith(fontSize: 12),
              );
            }).toList(),
          ),
          20.verticalSpace,
          RadialProgressChart(
            title: radialChart.title,
            progress: radialData.progress,
          ),
        ],
      ),
    );
  }

  /// Maps string color keys from JSON to actual AppColors.
  Color _mapColor(String key) {
    switch (key) {
      case 'primary':
        return AppColors.primary;
      case 'royalBlue':
        return AppColors.royalBlue;
      case 'limeGreen':
        return AppColors.limeGreen;
      // Add more mappings as needed
      default:
        return Colors.grey;
    }
  }
}
