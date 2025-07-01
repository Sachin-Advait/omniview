import 'package:flutter/material.dart';
import 'package:omniview/config/theme/app_colors.dart';

class ChartCard extends StatelessWidget {
  const ChartCard({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.darkSlate,
        borderRadius: BorderRadius.circular(30),
      ),
      child: child,
    );
  }
}
