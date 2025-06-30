import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:omniview/common/utils/custom_validation.dart';
import 'package:omniview/common/utils/size_config.dart';
import 'package:omniview/config/theme/app_colors.dart';
import 'package:omniview/config/theme/app_theme.dart';

class InputTextStyle {
  static TextStyle inputStyle(BuildContext context) {
    return context.medium.copyWith(fontSize: 15);
  }
}

mixin CustomDecorationMixin {
  InputDecoration customDecoration({
    required BuildContext context,
    String? hintText,
    Widget? suffixIcon,
    Widget? prefixIcon,
    double? radius,
    IconButton? suffixIconButton,
    TextStyle? hintTextStyle,
    EdgeInsets? contentPadding,
    Color? borderColor,
    bool? hideBorder,
    Color? bgColor,
  }) {
    return InputDecoration(
      errorMaxLines: 2,
      contentPadding:
          contentPadding ??
          EdgeInsets.symmetric(
            horizontal: 16.widthMultiplier,
            vertical: 15.heightMultiplier,
          ),
      hintStyle:
          hintTextStyle ??
          context.regular.copyWith(color: AppColors.grey, fontSize: 14),
      border: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.primary),
        borderRadius: BorderRadius.circular(radius ?? 30),
      ),
      prefixIcon: prefixIcon,
      suffixIcon: suffixIconButton ?? suffixIcon,
      errorStyle: context.regular.copyWith(
        color: AppColors.deepRose,
        fontSize: 11,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(radius ?? 30),
        borderSide: BorderSide(
          width: 1,
          color: borderColor ?? AppColors.primary,
        ),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(radius ?? 30),
        borderSide: BorderSide(width: 1, color: borderColor ?? AppColors.grey),
      ),
      filled: true,
      fillColor: bgColor ?? AppColors.darkSlate,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(radius ?? 30),
        borderSide: BorderSide(width: 1, color: AppColors.primary),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(radius ?? 30),
        borderSide: BorderSide(width: 1, color: AppColors.primary),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(radius ?? 30),
        borderSide: BorderSide(width: 1, color: AppColors.rosePink),
      ),
      hintText: hintText,
      helperText: '',
    );
  }
}

class UniversalTextField extends StatelessWidget with CustomDecorationMixin {
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final Widget? prefixIcon;
  final bool? enabled;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final String? hintText;
  final TextStyle? hintTextStyle;
  final double? radius;
  final Color? borderColor;
  final Color? bgColor;
  final bool? hideBorder;
  final int? maxLines;
  final bool? enableFilled;
  final EdgeInsets? contentPadding;
  final TextStyle? textStyle;
  final bool? readOnly;
  final List<TextInputFormatter>? inputFormatters;
  final Function()? onTap;
  final Function(String)? onChanged;
  final AutovalidateMode? autovalidateMode;
  final FocusNode? focusNode;

  const UniversalTextField({
    super.key,
    required this.controller,
    this.keyboardType,
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
    this.enabled,
    this.hintText,
    this.hintTextStyle,
    this.radius,
    this.borderColor,
    this.bgColor,
    this.hideBorder,
    this.maxLines,
    this.enableFilled,
    this.contentPadding,
    this.textStyle,
    this.readOnly,
    this.inputFormatters,
    this.onTap,
    this.autovalidateMode,
    this.focusNode,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: enabled,
      readOnly: readOnly ?? false,
      obscureText: false,
      onTap: onTap,
      style: textStyle ?? InputTextStyle.inputStyle(context),
      cursorErrorColor: AppColors.primary,
      autovalidateMode: autovalidateMode ?? AutovalidateMode.onUserInteraction,
      controller: controller,
      cursorColor: AppColors.primary,
      keyboardType: keyboardType,
      maxLines: maxLines ?? 1,
      inputFormatters: inputFormatters,
      focusNode: focusNode,
      onChanged: onChanged,
      decoration: customDecoration(
        hintText: hintText,
        hintTextStyle: hintTextStyle,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        bgColor: bgColor,
        context: context,
        borderColor: borderColor,
        hideBorder: hideBorder,
        radius: radius,
        contentPadding: contentPadding,
      ),
      validator: validator,
    );
  }
}

class PhoneTextField extends StatelessWidget with CustomDecorationMixin {
  final TextEditingController controller;
  final Widget? prefixIcon;
  final bool autofocus;
  final bool? enableFilled;
  final double? radius;
  final Color? borderColor;

  const PhoneTextField({
    super.key,
    required this.controller,
    this.prefixIcon,
    this.autofocus = false,
    this.enableFilled,
    this.radius,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: autofocus,
      validator: CustomValidtion.isPhone,
      controller: controller,
      keyboardType: TextInputType.phone,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      cursorColor: AppColors.primary,
      inputFormatters: [
        LengthLimitingTextInputFormatter(10),
        FilteringTextInputFormatter.deny(RegExp(r'\s')),
        FilteringTextInputFormatter.digitsOnly,
      ],
      decoration: customDecoration(
        hintText: 'Phone number',
        context: context,
        prefixIcon: prefixIcon,
      ),
      style: InputTextStyle.inputStyle(context),
    );
  }
}

class EmailTextField extends StatelessWidget with CustomDecorationMixin {
  final TextEditingController controller;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool? enabled;
  final String? hintText;
  final Color? bgColor;
  final Color? borderColor;

  const EmailTextField({
    super.key,
    required this.controller,
    this.prefixIcon,
    this.suffixIcon,
    this.enabled,
    this.hintText,
    this.bgColor,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: enabled,
      controller: controller,
      keyboardType: TextInputType.emailAddress,
      cursorColor: AppColors.primary,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: CustomValidtion.isEmail,
      decoration: customDecoration(
        bgColor: bgColor,
        borderColor: borderColor,
        context: context,
        hintText: hintText ?? 'Enter Email',
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
      ),
      inputFormatters: [FilteringTextInputFormatter.deny(RegExp(r'\s'))],
      style: InputTextStyle.inputStyle(context),
    );
  }
}

// class SearchTextField extends StatelessWidget {
//   const SearchTextField({
//     this.onTap,
//     required this.controller,
//     this.isReadOnly,
//     this.onChanged,
//     this.onFieldSubmitted,
//     this.hintText,
//     this.background,
//     this.borderColor,
//     this.showCloseIcon,
//     this.onCloseTap,
//     super.key,
//   });

//   final bool? isReadOnly;
//   final VoidCallback? onTap;
//   final Function(String)? onChanged;
//   final Function(String)? onFieldSubmitted;
//   final TextEditingController? controller;
//   final String? hintText;
//   final Color? background;
//   final Color? borderColor;
//   final bool? showCloseIcon;
//   final void Function()? onCloseTap;

//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       controller: controller,
//       readOnly: isReadOnly ?? false,
//       onTap: onTap,
//       onChanged: onChanged,
//       onFieldSubmitted: onFieldSubmitted,
//       style: CustomTextStyle.size14W500(color: AppColors.white100),
//       cursorColor: AppColors.primary,
//       decoration: InputDecoration(
//         prefixIcon: Padding(
//           padding: const EdgeInsets.only(left: 18, right: 10),
//           child: SvgPicture.asset(SvgAssets.searchIcon, height: 20),
//         ),
//         prefixIconConstraints: BoxConstraints(),
//         border: InputBorder.none, // Removes default border
//         contentPadding: EdgeInsets.symmetric(
//           horizontal: 16.widthMultiplier,
//           vertical: 12.heightMultiplier,
//         ),
//         hintText: hintText ?? "Search by 🏠 Address, City, or ZIP",
//         hintStyle: CustomTextStyle.size14W500(color: AppColors.white100),
//         suffixIcon: showCloseIcon == true
//             ? ClickableButton(
//                 onTap: onCloseTap,
//                 child: Container(
//                   padding: EdgeInsets.only(left: 20, right: 4),
//                   child: SvgPicture.asset(
//                     SvgAssets.redClose,
//                     colorFilter: ColorFilter.mode(
//                       AppColors.white100,
//                       BlendMode.srcIn,
//                     ),
//                     height: 9,
//                   ),
//                 ),
//               )
//             : null,
//       ),
//     );
//   }
// }
