import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:omniview/config/theme/app_colors.dart';
import 'package:omniview/modules/dashboard/components/stat_card.dart';

class StatBuilder extends StatelessWidget {
  const StatBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            StatCard(
              icon: Icons.attach_money,
              title: 'Revenue YTD',
              subtitle: '+4.83%',
              value: '\$1.322B',
              color: AppColors.violet.withValues(alpha: .5),
              trailing: Icon(Icons.show_chart, color: AppColors.primary),
            ),
            10.horizontalSpace,
            StatCard(
              icon: Icons.groups,
              title: 'EBITDA %',
              subtitle: '+0.6pp',
              value: '28.43%',
              color: AppColors.royalBlue.withValues(alpha: .5),
              trailing: Icon(Icons.show_chart, color: AppColors.royalBlue),
            ),
            10.horizontalSpace,
            StatCard(
              icon: Icons.groups,
              title: 'NPS',
              subtitle: '▲2',
              value: '62',
              color: AppColors.limeGreen.withValues(alpha: .5),
              trailing: Icon(Icons.show_chart, color: AppColors.cyan),
            ),
            10.horizontalSpace,
            StatCard(
              icon: Icons.attach_money,
              title: 'Health Idx',
              subtitle: '▲1',
              value: '81',
              color: AppColors.softOrange.withValues(alpha: .5),
              trailing: Icon(Icons.show_chart, color: AppColors.softOrange),
            ),
          ],
        ),
      ),
    );
  }
}
