import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:omniview/common/utils/size_config.dart';
import 'package:omniview/config/assets/app_svg.dart';
import 'package:omniview/config/theme/app_colors.dart';
import 'package:omniview/config/theme/app_theme.dart';
import 'package:omniview/modules/chat_bot/chat_bot.dart';
import 'package:omniview/modules/dashboard/dashborad_charts.dart';
import 'package:omniview/modules/insight/insight.dart';
import 'package:omniview/modules/pulse/page/pulse.dart';
import 'package:omniview/modules/setting/setting.dart';

class Dashboard extends StatefulWidget {
  final Widget? child;
  const Dashboard({super.key, this.child});

  @override
  State<Dashboard> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<Dashboard> {
  int selectedIndex = 2;

  final List<Widget> navBarItems = const [
    Pulse(),
    Insight(),
    DashboardCharts(),
    ChatBot(),
    Setting(),
  ];

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvokedWithResult: (didPop, result) {
        // Handle back press logic if needed
      },
      child: Scaffold(
        body: navBarItems[selectedIndex],
        bottomNavigationBar: Container(
          padding: EdgeInsets.symmetric(horizontal: 15.widthMultiplier),
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(30),
          ),
          child: SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                NavItem(
                  icon: AppSvg.pulse,
                  index: 0,
                  name: "Pulse",
                  isSelected: selectedIndex == 0,
                  onTap: onItemTapped,
                ),
                NavItem(
                  icon: AppSvg.insight,
                  index: 1,
                  name: "Insight",
                  isSelected: selectedIndex == 1,
                  onTap: onItemTapped,
                ),
                NavItem(
                  icon: AppSvg.dashboard,
                  index: 2,
                  name: "Dashboard",
                  isSelected: selectedIndex == 2,
                  onTap: onItemTapped,
                ),
                NavItem(
                  icon: AppSvg.chatBot,
                  index: 3,
                  name: "Chatbot",
                  isSelected: selectedIndex == 3,
                  onTap: onItemTapped,
                ),
                NavItem(
                  icon: AppSvg.setting,
                  index: 4,
                  name: "Setting",
                  isSelected: selectedIndex == 4,
                  onTap: onItemTapped,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class NavItem extends StatelessWidget {
  final String icon;
  final int index;
  final String name;
  final bool isSvg;
  final double? height;
  final bool isSelected;
  final Function(int) onTap;

  const NavItem({
    super.key,
    required this.icon,
    required this.index,
    required this.name,
    required this.isSelected,
    required this.onTap,
    this.height,
    this.isSvg = true,
  });

  @override
  Widget build(BuildContext context) {
    final textStyle = isSelected
        ? context.medium
        : context.medium.copyWith(color: Colors.white54);
    final iconColor = isSelected ? AppColors.white : AppColors.white75;

    return GestureDetector(
      onTap: () => onTap(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          10.verticalSpace,
          if (!isSelected)
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: SvgPicture.asset(
                icon,
                height: height ?? 25.heightMultiplier,
                width: height ?? 25.widthMultiplier,
                colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
              ),
            ),
          10.verticalSpace,
          if (isSelected) Text(name, style: textStyle),
          if (isSelected)
            Container(
              width: 8,
              height: 8,
              margin: EdgeInsets.only(top: 6),
              decoration: BoxDecoration(
                color: AppColors.white,
                shape: BoxShape.circle,
              ),
            ),
        ],
      ),
    );
  }
}
