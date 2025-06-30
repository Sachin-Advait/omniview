import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:omniview/common/utils/size_config.dart';
import 'package:omniview/config/assets/app_svg.dart';
import 'package:omniview/config/theme/app_colors.dart';
import 'package:omniview/config/theme/app_theme.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showBackButton;

  const CustomAppBar({
    super.key,
    required this.title,
    this.showBackButton = false,
  });

  @override
  Widget build(BuildContext context) {
    if (kIsWeb) return SizedBox();
    return AppBar(
      surfaceTintColor: Colors.transparent,
      automaticallyImplyLeading: false,
      centerTitle: false,
      titleSpacing: 0,
      backgroundColor: AppColors.deepNavy,
      title: Padding(
        padding: const EdgeInsets.only(left: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            if (showBackButton)
              InkWell(
                onTap: () => context.pop(),
                child: SvgPicture.asset(AppSvg.arrowBack),
              ),
            if (showBackButton) 20.horizontalSpace else 10.horizontalSpace,
            Expanded(
              child: Text(title, style: context.medium.copyWith(fontSize: 20)),
            ),
            20.horizontalSpace,
          ],
        ),
      ),
      actions: [
        Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: AppColors.darkSlate,
            border: Border.all(color: AppColors.primary),
            borderRadius: BorderRadius.circular(30),
          ),
          child: SvgPicture.asset(
            AppSvg.notification,
            height: 13,
            colorFilter: ColorFilter.mode(AppColors.white, BlendMode.srcIn),
          ),
        ),
        15.horizontalSpace,
        Container(
          decoration: BoxDecoration(
            color: AppColors.darkSlate,
            border: Border.all(color: AppColors.primary),
            borderRadius: BorderRadius.circular(30),
          ),
          child: SvgPicture.asset(
            AppSvg.light,
            height: 30,
            colorFilter: ColorFilter.mode(AppColors.white, BlendMode.srcIn),
          ),
        ),
        10.horizontalSpace,
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(66);
}
