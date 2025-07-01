import 'package:animated_navbar/animated_navbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:omniview/common/utils/size_config.dart';
import 'package:omniview/config/assets/app_svg.dart';
import 'package:omniview/config/theme/app_colors.dart';
import 'package:omniview/modules/chat_bot/page/chat_bot.dart';
import 'package:omniview/modules/dashboard/page/dashborad.dart';
import 'package:omniview/modules/insight/page/insight.dart';
import 'package:omniview/modules/pulse/page/pulse.dart';
import 'package:omniview/modules/setting/page/setting.dart';
import 'package:omniview/routes/routes.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<NavBar> {
  int selectedIndex = 2;

  final List<Widget> navBarItems = const [
    Pulse(),
    Insight(),
    Dashboard(),
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
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, bottom: 20),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(90),
            child: AnimatedNavbar(
              showDotIndicator: selectedIndex == 2 ? false : true,
              backgroundColor: AppColors.primary,
              selectedIndex: selectedIndex,
              showElevation: true,
              onItemSelected: (index) => setState(() {
                selectedIndex = index;
              }),
              items: [
                flashyTabbar(AppSvg.pulse, 0),
                flashyTabbar(AppSvg.insight, 1),
                flashyTabbar(AppSvg.dashboard, 2),
                flashyTabbar(AppSvg.chatBot, 3),
                flashyTabbar(AppSvg.setting, 4),
              ],
            ),
          ),
        ),
      ),
    );
  }

  AnimatedNavbarItem flashyTabbar(String svg, int index) {
    final iconColor = selectedIndex == index
        ? AppColors.white
        : AppColors.white75;
    final icon = Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: AppColors.white.withValues(alpha: .15),
          width: 6,
        ),
      ),

      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: AppColors.white.withValues(alpha: .34),
            width: 6,
          ),
        ),

        child: SvgPicture.asset(
          svg,
          height: 25.heightMultiplier,
          width: 25.widthMultiplier,
          colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
        ),
      ),
    );
    return AnimatedNavbarItem(
      onTap: index != 3
          ? null
          : () {
              context.pushNamed(Routes.chatBot);
            },
      enableAnimation: index == 2 ? false : true,
      activeColor: AppColors.white,
      icon: index == 2
          ? icon
          : SvgPicture.asset(
              svg,
              height: 25.heightMultiplier,
              width: 25.widthMultiplier,
              colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
            ),
    );
  }
}
