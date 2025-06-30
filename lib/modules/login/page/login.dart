import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:omniview/common/widgets/custom_text_fields.dart';
import 'package:omniview/config/assets/app_images.dart';
import 'package:omniview/config/theme/app_colors.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class Login extends StatelessWidget {
  const Login({super.key});

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
              controller: TextEditingController(),
              hintText: 'Eg. 2422457',
            ),
          ),
          const SizedBox(height: 20),
          TextButton(
            onPressed: () {
              showModalBottomSheet(
                useSafeArea: true,
                context: context,
                builder: (context) {
                  return Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 32,
                      horizontal: 24,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(32),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          'Verify Number',
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Please enter the OTP sent to your\nmobile number xxxx789',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: AppColors.white.withOpacity(.9),
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 24),
                        PinCodeTextField(
                          controller: TextEditingController(),
                          pinTheme: PinTheme(
                            activeFillColor: AppColors.white,
                            fieldWidth: 60,
                            fieldHeight: 60,
                            fieldOuterPadding: EdgeInsets.symmetric(
                              horizontal: 5,
                            ),
                            borderRadius: BorderRadius.circular(15),
                            activeColor: AppColors.white,
                            inactiveColor: AppColors.white.withOpacity(.5),
                            selectedFillColor: AppColors.white,
                            inactiveFillColor: AppColors.white.withOpacity(.5),
                            selectedColor: AppColors.white,
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
                          // validator: CustomValidtion.is4DigitOtp,
                          autoDisposeControllers: false,
                          mainAxisAlignment: MainAxisAlignment.center,
                          errorTextSpace: 30,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.deepNavy,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 50,
                                vertical: 16,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            onPressed: () {},
                            child: const Text(
                              'Submit',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),
                      ],
                    ),
                  );
                },
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              padding: const EdgeInsets.symmetric(horizontal: 54, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Verify",
                style: const TextStyle(
                  fontSize: 15,
                  color: AppColors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
