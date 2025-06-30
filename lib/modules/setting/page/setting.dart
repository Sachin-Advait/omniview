import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:omniview/common/widgets/custom_appbar.dart';
import 'package:omniview/config/assets/app_svg.dart';
import 'package:omniview/config/theme/app_colors.dart';
import 'package:omniview/config/theme/app_theme.dart';
import 'package:omniview/data/source/local/session_manager.dart';
import 'package:omniview/modules/setting/components/setting_tile.dart';
import 'package:omniview/routes/Routes.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  bool _switchValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Setting'),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 12),
        children: [
          20.verticalSpace,
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            minLeadingWidth: 0,
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('John', style: context.medium.copyWith(fontSize: 18)),
                Text('12324532', style: context.regular),
                Text('eamil@gail.com', style: context.regular),
              ],
            ),
            trailing: SvgPicture.asset(
              AppSvg.edit,
              height: 20,
              colorFilter: const ColorFilter.mode(
                AppColors.primary,
                BlendMode.srcIn,
              ),
            ),
          ),

          20.verticalSpace,
          SettingTile(
            icon: AppSvg.notification,
            tileColor: AppColors.royalBlue,
            title: 'Notification Alert',
            trailing: CupertinoSwitch(
              activeTrackColor: AppColors.white,
              thumbIcon: WidgetStatePropertyAll(
                Icon(Icons.power_settings_new, color: AppColors.white),
              ),
              value: _switchValue,
              inactiveThumbColor: AppColors.deepRose,
              thumbColor: AppColors.primary,
              inactiveTrackColor: AppColors.white,
              onChanged: (value) {
                setState(() {
                  _switchValue = value;
                });
              },
            ),
          ),
          15.verticalSpace,
          SettingTile(
            icon: AppSvg.notification,
            tileColor: AppColors.rosePink,
            title: 'Help and Support',
          ),
          15.verticalSpace,
          SettingTile(
            icon: AppSvg.filter,
            tileColor: AppColors.softOrange,
            title: 'Logout',
            onTap: () {
              SessionManager.clearSession();
              SessionManager.saveIsFirstTime(true);
              context.goNamed(Routes.login);
            },
          ),
        ],
      ),
    );
  }
}
