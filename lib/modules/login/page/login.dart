import 'package:flutter/material.dart';
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
      body: Column(
        children: [
          Transform.rotate(
            angle: 110,
            child: Image.asset(AppImages.splashEffect),
          ),
          Container(
            alignment: Alignment.center,
            child: Image.asset(AppImages.appLogo, height: 140),
          ),
          const SizedBox(height: 60),
          Text(
            'Login or Register',
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColors.white,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'Enter staff id , verify otp to enjoy ost',
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 14, color: Colors.white70),
          ),
          const SizedBox(height: 14),

          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            alignment: Alignment.centerLeft,
            child: Text(
              'Staff ID',
              style: const TextStyle(fontSize: 16, color: AppColors.white),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: UniversalTextField(
              controller: staffController,
              hintText: 'Enter your Staff Id',
            ),
          ),
          const SizedBox(height: 20),
          PurpleButton(title: 'Verify', onPressed: () => otpVerify(context)),
        ],
      ),
    );
  }
}
