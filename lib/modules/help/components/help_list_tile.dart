import 'package:flutter/material.dart';
import 'package:omniview/config/theme/app_colors.dart';
import 'package:omniview/config/theme/app_theme.dart';

class HelpTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subTitle;

  const HelpTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.deepNavy,
        borderRadius: BorderRadius.circular(20),
      ),
      child: ListTile(
        leading: Container(
          width: 40,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.royalBlue.withOpacity(.2),
          ),
          child: Icon(icon, color: AppColors.royalBlue),
        ),
        title: Text(title, style: context.medium.copyWith(fontSize: 15)),
        subtitle: Text(subTitle, style: context.regular.copyWith(fontSize: 14)),
      ),
    );
  }
}
