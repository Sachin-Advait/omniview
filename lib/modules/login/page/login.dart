import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:omniview/common/utils/custom_validation.dart';
import 'package:omniview/common/utils/global_keys.dart';
import 'package:omniview/common/widgets/custom_text_fields.dart';
import 'package:omniview/common/widgets/custom_toast.dart';
import 'package:omniview/common/widgets/purple_button.dart';
import 'package:omniview/config/assets/app_images.dart';
import 'package:omniview/config/theme/app_colors.dart';
import 'package:omniview/data/source/local/bloc/user_bloc.dart';
import 'package:omniview/modules/login/bloc/login_bloc.dart';
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
      body: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoginLoading) {
            //
          } else if (state is LoginSuccess) {
            otpVerify(context);
            context.read<UserBloc>().add(SetUserEvent(state.user));
          } else if (state is LoginFailure) {
            customToast(message: 'User not found');
          }
        },
        child: Stack(
          children: [
            Transform.rotate(
              angle: 110,
              child: Image.asset(AppImages.splashEffect),
            ),
            Form(
              key: GlobalKeys.loginFormKey,
              child: ListView(
                children: [
                  250.verticalSpace,
                  Container(
                    alignment: Alignment.center,
                    child: Image.asset(AppImages.splashLogo, height: 140),
                  ),
                  40.verticalSpace,
                  Center(
                    child: Text(
                      'Login',
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                  14.verticalSpace,
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Staff ID',
                      style: const TextStyle(
                        fontSize: 16,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                  10.verticalSpace,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: UniversalTextField(
                      controller: staffController,
                      hintText: 'Enter your Staff Id',
                      validator: CustomValidtion.isStaffId,
                      keyboardType: TextInputType.name,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      inputFormatters: [
                        FilteringTextInputFormatter.deny(RegExp(r'\s')),
                        LengthLimitingTextInputFormatter(10),
                      ],
                    ),
                  ),
                  20.verticalSpace,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 80),
                    child: BlocBuilder<LoginBloc, LoginState>(
                      builder: (context, state) {
                        return PurpleButton(
                          title: 'Verify',
                          isLoading: state is LoginLoading,
                          onPressed: () {
                            if (GlobalKeys.loginFormKey.currentState!
                                .validate()) {
                              context.read<LoginBloc>().add(
                                LoginRequested(staffController.text),
                              );
                            }
                          },
                        );
                      },
                    ),
                  ),
                  20.verticalSpace,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
