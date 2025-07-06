import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:omniview/common/utils/size_config.dart';
import 'package:omniview/config/assets/app_svg.dart';
import 'package:omniview/config/theme/app_colors.dart';
import 'package:omniview/modules/nav_bar/cubit/nav_bar_cubit.dart';
import 'package:omniview/modules/nav_bar/page/components/animated_navbar_widget.dart';
import 'package:omniview/routes/app_routes.dart';

class NavBarContent extends StatelessWidget {
  const NavBarContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
              return AnimatedNavbarWidget(
                backgroundColor: AppColors.primary,
                selectedIndex: selectedIndex,
                showDotIndicator: selectedIndex != 2,
                onItemSelected: (index) {
                  if (index == 3) {
                    context.pushNamed(Routes.chatBot);
                  } else {
                    context.read<NavBarCubit>().setIndex(index);
                  }
                },
                items: [
                  navBarItemData(null, AppSvg.pulse, selectedIndex == 0),
                  navBarItemData(null, AppSvg.insight, selectedIndex == 1),
                  navBarItemData(
                    null,
                    AppSvg.dashboard,
                    selectedIndex == 2,
                    height: selectedIndex == 2 ? null : 28,
                  ),
                  navBarItemData(
                    null,
                    AppSvg.chatBot,
                    selectedIndex == 3,
                    height: 28,
                  ),
                  navBarItemData(
                    null,
                    AppSvg.setting,
                    selectedIndex == 4,
                    height: 25,
                  ),
                  // final icon = Container(
                  //   decoration: BoxDecoration(
                  //     shape: BoxShape.circle,
                  //     border: Border.all(
                  //       color: AppColors.white.withValues(alpha: 0),
                  //       width: 4,
                  //     ),
                  //   ),
                  //   child: Container(
                  //     decoration: BoxDecoration(
                  //       shape: BoxShape.circle,
                  //       border: Border.all(
                  //         color: AppColors.white.withValues(alpha: 0),
                  //         width: 4,
                  //       ),
                  //     ),
                  //     child: Container(
                  //       padding: EdgeInsets.all(3),
                  //       decoration: BoxDecoration(
                  //         color: AppColors.primary,
                  //         borderRadius: BorderRadius.circular(30),
                  //       ),
                  //       child: SvgPicture.asset(
                  //         svg,
                  //         height: 25.heightMultiplier,
                  //         width: 25.widthMultiplier,
                  //         colorFilter: ColorFilter.mode(
                  //           iconColor,
                  //           BlendMode.srcIn,
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // )
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  NavbarItemData navBarItemData(
    Widget? icon,
    String? svg,
    bool selected, {
    double? height,
  }) {
    final iconColor = selected ? AppColors.white : AppColors.white75;
    return NavbarItemData(
      icon:
          icon ??
          Container(
            padding: EdgeInsets.all(3),
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(30),
            ),
            child: SvgPicture.asset(
              svg!,
              height: (height ?? 25).heightMultiplier,
              colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
            ),
          ),
    );
  }
}
