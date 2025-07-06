import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:omniview/common/widgets/custom_appbar.dart';
import 'package:omniview/config/assets/app_svg.dart';
import 'package:omniview/config/theme/app_colors.dart';
import 'package:omniview/config/theme/app_theme.dart';
import 'package:omniview/data/models/user_model.dart';
import 'package:omniview/data/source/local/session_manager.dart';
import 'package:omniview/modules/setting/components/setting_tile.dart';
import 'package:omniview/routes/app_routes.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  bool _switchValue = false;

  late UserModel user;

  @override
  void initState() {
    user = SessionManager.getUser();
    super.initState();
  }

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
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
              child: ClipRRect(
                borderRadius: BorderRadiusGeometry.circular(12),
                child: Image.network(user.image, fit: BoxFit.cover),
              ),
            ),
            minLeadingWidth: 0,
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(user.name, style: context.medium.copyWith(fontSize: 18)),
                Text(user.role, style: context.regular.copyWith(fontSize: 18)),
              ],
            ),
            trailing: InkWell(
              onTap: () => context.pushNamed(Routes.profile, extra: user),
              child: SvgPicture.asset(
                AppSvg.edit,
                height: 20,
                colorFilter: const ColorFilter.mode(
                  AppColors.primary,
                  BlendMode.srcIn,
                ),
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
            icon: AppSvg.help,
            tileColor: AppColors.rosePink,
            title: 'Help and Support',
          ),
          15.verticalSpace,
          SettingTile(
            icon: AppSvg.logout,
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
