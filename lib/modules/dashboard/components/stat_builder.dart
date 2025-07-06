import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:omniview/config/theme/app_colors.dart';
import 'package:omniview/data/models/user_model.dart';
import 'package:omniview/modules/dashboard/components/stat_card.dart';

class StatBuilder extends StatelessWidget {
  const StatBuilder({super.key, required this.summary});

  final List<Summary> summary;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            StatCard(
              title: summary[0].label,
              subtitle: summary[0].change,
              value: summary[0].value,
              color: AppColors.violet.withValues(alpha: .5),
              trailing: Icon(Icons.show_chart, color: AppColors.primary),
            ),
            10.horizontalSpace,
            StatCard(
              title: summary[1].label,
              subtitle: summary[1].change,
              value: summary[1].value,
              color: AppColors.royalBlue.withValues(alpha: .5),
              trailing: Icon(Icons.show_chart, color: AppColors.royalBlue),
            ),
            10.horizontalSpace,
            StatCard(
              title: summary[2].label,
              subtitle: summary[2].change,
              value: summary[2].value,
              color: AppColors.limeGreen.withValues(alpha: .5),
              trailing: Icon(Icons.show_chart, color: AppColors.cyan),
            ),
            10.horizontalSpace,
            StatCard(
              title: summary[3].label,
              subtitle: summary[3].change,
              value: summary[3].value,
              color: AppColors.softOrange.withValues(alpha: .5),
              trailing: Icon(Icons.show_chart, color: AppColors.softOrange),
            ),
          ],
        ),
      ),
    );
  }
}
