import 'package:flutter/material.dart';
import 'package:omniview/config/theme/app_theme.dart';

class TabItem extends StatelessWidget {
  final String title;

  const TabItem({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Text(
        title,
        style: context.medium,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
