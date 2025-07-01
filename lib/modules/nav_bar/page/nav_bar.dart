import 'package:animated_navbar/animated_navbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:omniview/common/utils/size_config.dart';
import 'package:omniview/config/assets/app_svg.dart';
import 'package:omniview/config/theme/app_colors.dart';
import 'package:omniview/modules/chat_bot/page/chat_bot.dart';
import 'package:omniview/modules/dashboard/page/dashborad.dart';
import 'package:omniview/modules/insight/page/insight.dart';
import 'package:omniview/modules/nav_bar/cubit/nav_bar_cubit.dart';
import 'package:omniview/modules/pulse/page/pulse.dart';
import 'package:omniview/modules/setting/page/setting.dart';
import 'package:omniview/routes/routes.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  final List<Widget> navBarItems = const [
    Pulse(),
    Insight(),
    Dashboard(),
    ChatBot(),
    Setting(),
  ];

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop) {
          context.read<NavBarCubit>().goBack();
        }
      },
      child: Scaffold(
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            BlocBuilder<NavBarCubit, int>(
              builder: (context, selectedIndex) {
                return navBarItems[selectedIndex];
              },
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.deepNavy,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60),
                      topRight: Radius.circular(60),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(90),
                      child: BlocBuilder<NavBarCubit, int>(
                        builder: (context, selectedIndex) {
                          return AnimatedNavbar(
                            showDotIndicator: selectedIndex == 2 ? false : true,
                            backgroundColor: AppColors.primary,
                            selectedIndex: selectedIndex,
                            showElevation: true,
                            // height: 50,
                            onItemSelected: (index) {
                              if (index == 3) {
                                context.pushNamed(Routes.chatBot);
                              } else {
                                context.read<NavBarCubit>().setIndex(index);
                              }
                            },
                            items: List.generate(5, (index) {
                              final svg = [
                                AppSvg.pulse,
                                AppSvg.insight,
                                AppSvg.dashboard,
                                AppSvg.chatBot,
                                AppSvg.setting,
                              ][index];

                              final iconColor = selectedIndex == index
                                  ? AppColors.white
                                  : AppColors.white75;

                              final icon = Container(
                                margin: EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: AppColors.white.withValues(
                                      alpha: .15,
                                    ),
                                    width: 6,
                                  ),
                                ),
                                child: Container(
                                  padding: const EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: AppColors.white.withValues(
                                        alpha: .34,
                                      ),
                                      width: 6,
                                    ),
                                  ),
                                  child: SvgPicture.asset(
                                    svg,
                                    colorFilter: ColorFilter.mode(
                                      iconColor,
                                      BlendMode.srcIn,
                                    ),
                                  ),
                                ),
                              );

                              return AnimatedNavbarItem(
                                onTap: index == 3
                                    ? () => context.pushNamed(Routes.chatBot)
                                    : null,
                                enableAnimation: index != 2,
                                activeColor: AppColors.white,
                                icon: index == 2
                                    ? icon
                                    : SvgPicture.asset(
                                        svg,
                                        height: 25.heightMultiplier,
                                        width: 25.widthMultiplier,
                                        colorFilter: ColorFilter.mode(
                                          iconColor,
                                          BlendMode.srcIn,
                                        ),
                                      ),
                              );
                            }),
                          );
                        },
                      ),
                    ),
                  ),
                ),
                Container(
                  color: AppColors.deepNavy,
                  padding: EdgeInsets.only(bottom: 20),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
