import 'package:flutter/material.dart';
import 'package:omniview/common/utils/size_config.dart';
import 'package:omniview/config/theme/app_colors.dart';
import 'package:omniview/config/theme/app_theme.dart';

class StatCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String value;
  final Color color;
  final Widget trailing;

  const StatCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.value,
    required this.color,
    required this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.lerp(color, Theme.of(context).cardColor, 0.6)!,
            Theme.of(context).scaffoldBackgroundColor,
          ],
          stops: [0.0, 1.0],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          transform: GradientRotation(.4),
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: context.medium.copyWith(fontSize: 15)),
              Text(
                subtitle,
                style: context.regular.copyWith(color: AppColors.limeGreen),
              ),
            ],
          ),
          6.verticalSpace,
          Row(
            children: [
              Text(value, style: context.medium.copyWith(fontSize: 18)),
              10.horizontalSpace,
              trailing,
            ],
          ),
        ],
      ),
    );
  }
}
