import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:omniview/common/utils/size_config.dart';
import 'package:omniview/config/assets/app_svg.dart';
import 'package:omniview/config/theme/app_colors.dart';
import 'package:omniview/config/theme/app_theme.dart';
import 'package:omniview/routes/app_routes.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showBackButton;
  final PreferredSizeWidget? bottom;

  const CustomAppBar({
    super.key,
    required this.title,
    this.showBackButton = false,
    this.bottom,
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
        padding: const EdgeInsets.only(left: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            if (showBackButton)
              InkWell(
                onTap: () => context.pop(),
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: SvgPicture.asset(AppSvg.arrowBack),
                ),
              ),
            10.horizontalSpace,
            Expanded(
              child: Text(title, style: context.medium.copyWith(fontSize: 20)),
            ),
            20.horizontalSpace,
          ],
        ),
      ),
      actions: [
        GestureDetector(
          onTap: () => context.pushNamed(Routes.notification),
          child: Container(
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
      bottom: bottom,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(66);
}
