import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:omniview/common/widgets/custom_text_fields.dart';
import 'package:omniview/common/widgets/purple_button.dart';
import 'package:omniview/config/assets/app_images.dart';
import 'package:omniview/config/theme/app_colors.dart';
import 'package:omniview/modules/login/components/otp_verify.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final staffController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Transform.rotate(
            angle: 110,
            child: Image.asset(AppImages.splashEffect),
          ),
          ListView(
            children: [
              250.verticalSpace,
              Container(
                alignment: Alignment.center,
                child: Image.asset(AppImages.appLogo, height: 140),
              ),
              60.verticalSpace,
              Center(
                child: Text(
                  'Login or Register',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppColors.white,
                  ),
                ),
              ),
              10.verticalSpace,
              Text(
                'Enter staff id , verify otp to enjoy ost',
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 14, color: Colors.white70),
              ),
              14.verticalSpace,
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                alignment: Alignment.centerLeft,
                child: Text(
                  'Staff ID',
                  style: const TextStyle(fontSize: 16, color: AppColors.white),
                ),
              ),
              10.verticalSpace,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: UniversalTextField(
                  controller: staffController,
                  hintText: 'Enter your Staff Id',
                ),
              ),
              20.verticalSpace,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 80),
                child: PurpleButton(
                  title: 'Verify',
                  onPressed: () => otpVerify(context),
                ),
              ),
              20.verticalSpace,
            ],
          ),
        ],
      ),
    );
  }
}
