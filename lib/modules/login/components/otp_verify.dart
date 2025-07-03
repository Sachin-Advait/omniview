import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:omniview/common/widgets/dark_button.dart';
import 'package:omniview/config/theme/app_colors.dart';
import 'package:omniview/config/theme/app_theme.dart';
import 'package:omniview/data/source/local/session_manager.dart';
import 'package:omniview/routes/routes.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

void otpVerify(BuildContext context) {
  final controller = TextEditingController();
  showModalBottomSheet(
    useSafeArea: true,
    isScrollControlled: true,
    context: context,
    builder: (context) {
      return Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 14),
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(32),
                topRight: Radius.circular(32),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Verify Number',
                  style: context.semiBold.copyWith(fontSize: 20),
                ),
                const SizedBox(height: 8),
                Text(
                  'Please enter the OTP',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: AppColors.white, fontSize: 14),
                ),
                const SizedBox(height: 24),
                PinCodeTextField(
                  controller: controller,
                  hintCharacter: '-',
                  hintStyle: TextStyle(color: AppColors.black),
                  pinTheme: PinTheme(
                    fieldWidth: 45,
                    fieldHeight: 45,
                    inactiveBorderWidth: 0,
                    fieldOuterPadding: EdgeInsets.symmetric(horizontal: 3),
                    borderRadius: BorderRadius.circular(15),
                    activeFillColor: AppColors.white,
                    activeColor: AppColors.white,
                    selectedColor: AppColors.white,
                    selectedFillColor: AppColors.white,
                    inactiveColor: AppColors.white.withValues(alpha: 0.5),
                    inactiveFillColor: AppColors.white.withValues(alpha: 0.5),
                    shape: PinCodeFieldShape.box,
                  ),
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  textStyle: const TextStyle(color: AppColors.black),
                  cursorColor: AppColors.black,
                  appContext: context,
                  keyboardType: TextInputType.number,
                  length: 6,
                  enableActiveFill: true,
                  autoFocus: true,
                  mainAxisAlignment: MainAxisAlignment.center,
                  errorTextSpace: 30,
                ),
                const SizedBox(height: 20),
                DarkButton(
                  titleText: 'Submit',
                  onTap: () {
                    SessionManager.saveToken('token');
                    context.goNamed(Routes.navBar);
                  },
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      );
    },
  );
}
