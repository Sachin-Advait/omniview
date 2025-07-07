import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:omniview/common/utils/size_config.dart';
import 'package:omniview/config/assets/app_svg.dart';
import 'package:omniview/config/theme/app_colors.dart';
import 'package:omniview/config/theme/app_theme.dart';

class BuildAssistanceMessages extends StatelessWidget {
  const BuildAssistanceMessages({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        10.verticalSpace,
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 2,
                    color: AppColors.white50.withValues(alpha: 0.2),
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: CircleAvatar(
                backgroundColor: AppColors.white,
                radius: 22.radiusMultipier,
                child: SvgPicture.asset(AppSvg.chatBot, height: 28),
              ),
            ),
            Spacer(),

            Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                children: [
                  ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: 150.widthMultiplier),
                    child: Text(
                      'Hii, how can I assist you?',
                      maxLines: 3,
                      style: context.medium.copyWith(
                        fontSize: 14,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                  5.horizontalSpace,
                  SvgPicture.asset(AppSvg.waveHands),
                ],
              ),
            ),
          ],
        ),
        40.verticalSpace,
      ],
    );
  }
}
