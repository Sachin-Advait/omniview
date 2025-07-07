import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:omniview/config/theme/app_colors.dart';
import 'package:omniview/config/theme/app_theme.dart';

class SettingTile extends StatelessWidget {
  final String icon;
  final String title;
  final Color tileColor;
  final Widget? trailing;
  final Function()? onTap;

  const SettingTile({
    super.key,
    required this.icon,
    required this.title,
    this.trailing,
    required this.tileColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      tileColor: tileColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      leading: Container(
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: AppColors.white.withValues(alpha: 0.4),
          borderRadius: BorderRadius.circular(8),
        ),
        child: SvgPicture.asset(
          icon,
          height: 22,
          colorFilter: const ColorFilter.mode(AppColors.white, BlendMode.srcIn),
        ),
      ),
      minLeadingWidth: 0,
      title: Text(
        title,
        style: context.medium.copyWith(fontSize: 16, color: AppColors.white),
      ),
      trailing: trailing,
    );
  }
}
