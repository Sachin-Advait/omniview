import 'package:omniview/common/constants/app_errors.dart';

class CustomValidtion {
  static String? isEmail(String? email) {
    const emailPattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    final isMatch = RegExp(emailPattern).hasMatch(email ?? '');
    if (email == null || email.isEmpty) {
      return AppErrors.fieldIsRequired;
    } else if (isMatch == false) {
      return AppErrors.emailErrorText;
    } else {
      return null;
    }
  }

  static String? isStaffId(String? phone) {
    if (phone == null || phone.isEmpty) {
      return AppErrors.fieldIsRequired;
    } else if (phone.length < 4) {
      return AppErrors.staffIdErrorText;
    } else {
      return null;
    }
  }

  static String? isPassword(String? password) {
    if (password == null || password.isEmpty) {
      return AppErrors.fieldIsRequired;
    } else if (password.length < 8) {
      return AppErrors.passwordErrorText;
    } else {
      return null;
    }
  }

  static String? isName(String? name) {
    if (name == null || name.isEmpty) {
      return AppErrors.nameErrorText;
    } else {
      return null;
    }
  }

  static String? is4DigitOtp(String? otp) {
    if ((otp ?? '').isEmpty) {
      return "Please enter verification code";
    } else if (otp!.length != 4) {
      return "Please enter a valid 4 digit verification code";
    } else {
      return null;
    }
  }
}
