import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:omniview/common/utils/size_config.dart';
import 'package:omniview/config/assets/app_images.dart';
import 'package:omniview/config/assets/app_svg.dart';
import 'package:omniview/config/theme/app_colors.dart';
import 'package:omniview/config/theme/app_theme.dart';
import 'package:omniview/config/theme/bloc/theme_bloc.dart';
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
    return AppBar(
      surfaceTintColor: Colors.transparent,
      automaticallyImplyLeading: false,
      centerTitle: false,
      titleSpacing: 0,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
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
                  child: SvgPicture.asset(
                    AppSvg.arrowBack,
                    colorFilter: ColorFilter.mode(
                      Theme.of(context).canvasColor,
                      BlendMode.srcIn,
                    ),
                  ),
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
              color: Theme.of(context).cardColor,
              border: Border.all(color: AppColors.primary),
              borderRadius: BorderRadius.circular(30),
            ),
            child: SvgPicture.asset(
              AppSvg.notification,
              height: 13,
              colorFilter: ColorFilter.mode(
                Theme.of(context).canvasColor,
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
        15.horizontalSpace,
        GestureDetector(
          onTap: () => context.read<ThemeBloc>().add(ToggleTheme()),
          child: Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              border: Border.all(color: AppColors.primary),
              borderRadius: BorderRadius.circular(30),
            ),
            child: BlocBuilder<ThemeBloc, ThemeState>(
              builder: (context, state) {
                return Image.asset(
                  state.isDark ? AppImages.light : AppImages.dark,
                  height: 20,
                  color: Theme.of(context).canvasColor,
                );
              },
            ),
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
