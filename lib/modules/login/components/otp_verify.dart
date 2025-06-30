import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:omniview/common/widgets/dark_button.dart';
import 'package:omniview/config/theme/app_colors.dart';
import 'package:omniview/config/theme/app_theme.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

void otpVerify(BuildContext context) {
  final controller = TextEditingController();
  showModalBottomSheet(
    useSafeArea: true,
    context: context,
    builder: (context) {
      return Container(
        padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(32),
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
              'Please enter the OTP sent to your\nmobile number xxxx789',
              textAlign: TextAlign.center,
              style: TextStyle(color: AppColors.white, fontSize: 14),
            ),
            const SizedBox(height: 24),
            PinCodeTextField(
              controller: controller,
              hintCharacter: '-',
              hintStyle: TextStyle(color: AppColors.black),
              pinTheme: PinTheme(
                fieldWidth: 60,
                fieldHeight: 60,
                inactiveBorderWidth: 0,
                fieldOuterPadding: EdgeInsets.symmetric(horizontal: 5),
                borderRadius: BorderRadius.circular(15),

                activeFillColor: AppColors.white,
                activeColor: AppColors.white,
                selectedColor: AppColors.white,
                selectedFillColor: AppColors.white,
                inactiveColor: AppColors.white.withValues(alpha: .5),
                inactiveFillColor: AppColors.white.withValues(alpha: .5),

                shape: PinCodeFieldShape.box,
              ),
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly,
              ],
              textStyle: const TextStyle(color: AppColors.black),
              cursorColor: AppColors.black,
              appContext: context,
              keyboardType: TextInputType.number,
              length: 4,
              enableActiveFill: true,
              autoFocus: true,
              mainAxisAlignment: MainAxisAlignment.center,
              errorTextSpace: 30,
            ),
            DarkButton(titleText: 'Submit'),
            const SizedBox(height: 30),
          ],
        ),
      );
    },
  );
}
