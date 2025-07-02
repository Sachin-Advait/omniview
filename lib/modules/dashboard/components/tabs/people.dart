import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:omniview/common/widgets/labeled_dount_chart.dart';
import 'package:omniview/common/widgets/radical_progess_chart.dart';
import 'package:omniview/config/theme/app_colors.dart';
import 'package:omniview/config/theme/app_theme.dart';

class People extends StatelessWidget {
  const People({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        children: [
          LabeledDonutChart(
            title: 'Digital Adoption % ',
            sections: [
              PieChartSectionData(
                value: 25,
                title: 'A',
                titlePositionPercentageOffset: 1.6,
                color: AppColors.primary,
                radius: 20,
                titleStyle: context.medium.copyWith(fontSize: 12),
              ),
              PieChartSectionData(
                value: 30,
                title: 'B',
                titlePositionPercentageOffset: 1.6,
                color: AppColors.royalBlue,
                radius: 20,
                titleStyle: context.medium.copyWith(fontSize: 12),
              ),
              PieChartSectionData(
                value: 45,
                title: 'C',
                titlePositionPercentageOffset: 1.6,
                color: AppColors.limeGreen.withValues(alpha: 0.6),
                radius: 20,
                titleStyle: context.medium.copyWith(fontSize: 12),
              ),
            ],
          ),
          20.verticalSpace,
          RadialProgressChart(title: 'Talent Health Index', progress: 31),
        ],
      ),
    );
  }
}
