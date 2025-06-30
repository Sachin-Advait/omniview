import 'package:flutter/material.dart';
import 'package:omniview/common/utils/size_config.dart';
import 'package:omniview/config/theme/app_colors.dart';
import 'package:omniview/config/theme/app_theme.dart';

class DarkButton extends StatelessWidget {
  final String titleText;
  final void Function()? onTap;
  final double? width;
  final double? height;
  final bool isLoading;

  const DarkButton({
    super.key,
    required this.titleText,
    this.onTap,
    this.width,
    this.height,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        FocusScope.of(context).unfocus();
        onTap!();
      },
      borderRadius: BorderRadius.circular(30.radiusMultipier),
      child: Container(
        alignment: Alignment.center,
        height: height ?? 52.heightMultiplier,
        width: width,
        padding: EdgeInsets.symmetric(
          vertical: 6.heightMultiplier,
          horizontal: 12.widthMultiplier,
        ),
        decoration: BoxDecoration(
          color: AppColors.darkSlate,
          borderRadius: BorderRadius.circular(30.radiusMultipier),
        ),
        child: isLoading
            ? SizedBox(
                width: 25,
                height: 25,
                child: CircularProgressIndicator(
                  color: AppColors.white,
                  strokeWidth: 2,
                ),
              )
            : Text(
                titleText,
                textAlign: TextAlign.center,
                style: context.semiBold.copyWith(fontSize: 16),
              ),
      ),
    );
  }
}
