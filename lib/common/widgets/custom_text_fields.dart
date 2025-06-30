import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:omniview/config/theme/app_colors.dart';

import '../utils/custom_validation.dart';

class UniversalTextField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final String? hintText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final List<TextInputFormatter>? inputFormatters;
  final TextCapitalization textCapitalization;
  final FocusNode? focusNode;
  final int maxLines;
  final bool readOnly;
  final bool isMakeDullOnReadOnly;
  final String? Function(String?)? validator;
  final void Function(String?)? onChanged;

  const UniversalTextField({
    super.key,
    required this.controller,
    this.keyboardType,
    this.hintText,
    this.suffixIcon,
    this.prefixIcon,
    this.inputFormatters,
    this.textCapitalization = TextCapitalization.none,
    this.focusNode,
    this.maxLines = 1,
    this.validator,
    this.readOnly = false,
    this.isMakeDullOnReadOnly = false,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: readOnly,
      focusNode: focusNode,
      controller: controller,
      validator: validator,
      keyboardType: keyboardType ?? TextInputType.text,
      textCapitalization: textCapitalization,
      cursorColor: AppColors.primary,
      cursorWidth: 1.5,
      onChanged: onChanged,
      decoration: InputDecoration(
        fillColor: isMakeDullOnReadOnly && readOnly
            ? AppColors.white.withValues(alpha: .7)
            : null,
        filled: readOnly && isMakeDullOnReadOnly,
        errorMaxLines: 2,
        hintText: hintText,
        contentPadding: EdgeInsets.symmetric(horizontal: 30),
        hintStyle: Theme.of(
          context,
        ).textTheme.titleMedium?.copyWith(color: AppColors.grey),
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: AppColors.primary, width: 1.5),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: AppColors.primary, width: 1.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: AppColors.primary, width: 2.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: AppColors.deepRose, width: 2.0),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: AppColors.deepRose, width: 2.0),
        ),
      ),
      inputFormatters: inputFormatters,
      style: Theme.of(
        context,
      ).textTheme.titleLarge?.copyWith(color: AppColors.white),
      maxLines: maxLines,
    );
  }
}

class PhoneTextField extends StatelessWidget {
  final TextEditingController controller;
  final Widget? prefixIcon;

  const PhoneTextField({super.key, required this.controller, this.prefixIcon});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorWidth: 1.5,
      validator: CustomValidtion.isPhone,
      controller: controller,
      keyboardType: TextInputType.phone,
      cursorColor: AppColors.primary,
      decoration: InputDecoration(
        hintText: "Enter Mobile Number",
        hintStyle: Theme.of(context).textTheme.titleMedium,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColors.primary, width: 1.5),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColors.primary, width: 1.5),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColors.deepRose, width: 2.0),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColors.deepRose, width: 2.0),
        ),
      ),
      inputFormatters: [LengthLimitingTextInputFormatter(10)],
      style: Theme.of(context).textTheme.titleLarge,
    );
  }
}
