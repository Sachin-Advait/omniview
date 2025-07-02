import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:omniview/common/widgets/chart_card.dart';
import 'package:omniview/config/theme/app_theme.dart';

class LabeledDonutChart extends StatelessWidget {
  final String title;
  final List<PieChartSectionData> sections;
  final double aspectRatio;

  const LabeledDonutChart({
    super.key,
    required this.title,
    required this.sections,
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
            child: PieChart(
              PieChartData(
                sectionsSpace: 0,
                centerSpaceRadius: 40,
                startDegreeOffset: -90,
                sections: sections,
              ),
            ),
          ),
          20.verticalSpace,
        ],
      ),
    );
  }
}
